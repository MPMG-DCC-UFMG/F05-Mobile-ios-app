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
        when(resolved: downloadCalls.map{self.downloadData(downloadInfo: $0)})
            .done{result in
                if(result.allSatisfy({$0.isFulfilled})){
                    self.updateStatus(status: WorkerStatus.success,message: "Download completo")
                }else{
                    self.updateStatus(status: WorkerStatus.failed,message: "Falha ao baixar dados")
                }
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
            self.updateProgress(message: "Verificando versão: \(downloadInfo.name())")
            firstly{
                downloadInfo.serverVersion()
            }.then{serverVersion in
                self.serverVersionChanged(serverVersion: serverVersion.version, currentVersion: currentVersion)
            }.then{hasServerChanged in
                self.downloadFromServer(downloadInfo: downloadInfo, hasServerChanged: hasServerChanged)
            }.done{
                dataFromServer in
                seal.fulfill(downloadInfo.onSuccess(list: dataFromServer))
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
