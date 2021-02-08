import Foundation
import FirebaseAuth
import SwiftUI

class ConfigurationViewModel : BaseViewModel,ObservableObject{
    
    @Published var message = "Conectando ao servidor ..."
    @Published var workerStatus = WorkerStatus.notStarted{
        didSet{
            if(self.workerStatus == .success){
                self.moveForward()
            }
        }
    }
    
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
        self.navController.replaceTop(AnyView(HomeView()))
    }
}
