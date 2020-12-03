import Foundation
import FirebaseAuth

class ConfigurationViewModel : ObservableObject{
    
    @Published var message = "Conectando ao servidor ..."
    @Published var workerStatus = WorkerStatus.notStarted
    
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
        self.workerStatus = WorkerStatus.notStarted
    }
    
    func moveForward(){
        self.workerStatus = WorkerStatus.success
    }
}
