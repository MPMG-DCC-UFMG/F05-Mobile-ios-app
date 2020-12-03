import Foundation
import RxSwift
import PromiseKit

class LoadServerDataWorker{
    
    let status = PublishSubject<(WorkerStatus,String)>()
    
    private var workerStatus: WorkerStatus = WorkerStatus.running
    private var workerMessage: String = "Conectando ao servidor..."
    
    func execute(){
        let downloadCalls: [BaseDownloadInfo] = [DownloadTypeWork(), DownloadTypePhoto(), DownloadCities(),
                                                 DownloadWorkStatus(), DownloadAssociation(), DownloadPublicWork()]
        self.updateStatus(status: WorkerStatus.running,message: "Conectando ao servidor...")
        executeHelper(downloadCalls: downloadCalls, index: 0)
    }
    
    private func executeHelper(downloadCalls: [BaseDownloadInfo], index: Int){
        if(index<downloadCalls.count){
            firstly{
                downloadData(downloadInfo: downloadCalls[index])
            }.done{ result in
                if(result){
                    self.executeHelper(downloadCalls: downloadCalls, index: index+1)
                }else{
                    self.updateStatus(status: WorkerStatus.failed,message: "Falha ao baixar dados")
                }
            }.catch{_ in
                self.updateStatus(status: WorkerStatus.failed,message: "Falha ao baixar dados")
            }
        }else{
            self.updateStatus(status: WorkerStatus.success,message: "Download completo")
        }
    }
    
    private func serverVersionChanged(serverVersion: Int,currentVersion: Int) -> Promise<Bool>{
        return Promise<Bool> {seal in
            seal.fulfill(serverVersion > currentVersion)
        }
    }
    
    private func downloadFromServer(downloadInfo: BaseDownloadInfo,hasServerChanged: Bool) -> Promise<Array<Decodable>>{
        if hasServerChanged{
            self.updateProgress(message: "Baixando dados de: \(downloadInfo.name())")
            return downloadInfo.loadInfo()
        }else{
            return Promise<Array<Decodable>> { seal in
                seal.fulfill([])
            }
        }
    }
    
    private func downloadData(downloadInfo: BaseDownloadInfo) -> Promise<Bool>{
        self.updateProgress(message: "Verificando versão: \(downloadInfo.name())")
        return Promise<Bool>{ seal in
            let currentVersion = downloadInfo.currentVersion()
            var _serverVersion = -1
            self.updateProgress(message: "Verificando versão: \(downloadInfo.name())")
            firstly{
                downloadInfo.serverVersion()
            }.map{serverVersion in
                _serverVersion = serverVersion.version
                return _serverVersion
            }.then{serverVersion in
                self.serverVersionChanged(serverVersion: serverVersion, currentVersion: currentVersion)
            }.then{hasServerChanged in
                self.downloadFromServer(downloadInfo: downloadInfo, hasServerChanged: hasServerChanged)
            }.done{dataFromServer in
                var updated = true
                if(!dataFromServer.isEmpty){
                    updated = downloadInfo.onSuccess(list: dataFromServer)
                    if(updated){
                        downloadInfo.updateCurrentVersion(serverVersion: _serverVersion)
                    }
                }
                
                seal.fulfill(updated)
            }.catch{ error in
                self.updateProgress(message: "Falha ao baixar: \(downloadInfo.name())")
                seal.reject(error)
            }
        }
    }
    
    private func updateProgress(message: String){
        self.workerMessage = message
        notify()
    }
    
    private func updateStatus(status: WorkerStatus, message:String = ""){
        self.workerStatus = status
        self.workerMessage = message
        notify()
    }
    
    private func notify(){
        self.status.onNext((self.workerStatus, self.workerMessage))
    }
}
