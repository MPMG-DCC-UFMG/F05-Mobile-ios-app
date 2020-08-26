import Foundation
import Promises

class LoadServerDataWorker: ObservableObject{
    
    @Published var workerStatus: WorkerStatus = WorkerStatus.RUNNING
    @Published var workerMessage: String = ""
    
    func execute(){
        Promise<Void>{
            let downloadCalls: [BaseDownloadInfo] = [DownloadTypeWork(), DownloadTypePhoto(), DownloadCities(),
                                                     DownloadWorkStatus(), DownloadAssociation(), DownloadPublicWork()]
            
            self.updateStatus(status: WorkerStatus.RUNNING)
            all(
                downloadCalls.map{self.downloadData(downloadInfo: $0)}
            ).then{ results in
                if(results.allSatisfy({$0})){
                    self.updateStatus(status: WorkerStatus.SUCCESS)
                }else{
                    self.updateStatus(status: WorkerStatus.FAILED)
                }
            }
        }.catch{_ in
            self.updateStatus(status: WorkerStatus.FAILED)
        }
    }
    
    private func downloadData(downloadInfo: BaseDownloadInfo) -> Promise<Bool>{
        return Promise{ fulfill, _ in
            let currentVersion = downloadInfo.currentVersion()
            let serverVersionResult = downloadInfo.serverVersion()
            
            self.updateProgress(message: "Verificando versão: \(downloadInfo.name())")
            serverVersionResult.then {serverVersion in
                if(serverVersion.version! > currentVersion){
                    self.updateProgress(message: "Atualizando: \(downloadInfo.name())")
                    downloadInfo.loadInfo().then{ dataFromServer in
                        let onDatabase = downloadInfo.onSuccess(list: dataFromServer)
                        if(!onDatabase){
                            self.updateProgress(message: "Falha ao baixar: \(downloadInfo.name())")
                        }else{
                            downloadInfo.updateCurrentVersion(serverVersion: serverVersion.version!)
                        }
                        fulfill(onDatabase)
                    }.catch{_ in
                        fulfill(false)
                    }
                }else{
                    fulfill(true)
                }
            }
        }
    }
    
    private func updateProgress(message: String){
        DispatchQueue.main.async {
            self.workerMessage = message
        }
    }
    
    private func updateStatus(status: WorkerStatus){
        DispatchQueue.main.async {
            self.workerStatus = status
        }
    }
    
}
