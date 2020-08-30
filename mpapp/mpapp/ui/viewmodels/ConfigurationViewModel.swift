import Foundation

class ConfigurationViewModel : ObservableObject{
    
    @Published var message = "Conectando ao servidor ..."
    @Published var workerStatus = WorkerStatus.NOT_STARTED
    
    func startConfigFilesDownload(){
        self.message = "Conectando ao servidor ..."
        DispatchQueue.global(qos: .background).async {
            let loadingWorker = LoadServerDataWorker()
            loadingWorker.status.asObservable().subscribe(onNext: { workerStatus, message in
                DispatchQueue.main.async {
                    self.message = message
                    self.workerStatus = workerStatus
                }
            })
            loadingWorker.execute()
        }
    }
    
    func resetWorkerStatus(){
        self.workerStatus = WorkerStatus.NOT_STARTED
    }
    
    func moveForward(){
        self.workerStatus = WorkerStatus.SUCCESS
    }
}
