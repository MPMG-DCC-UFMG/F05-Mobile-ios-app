import Foundation

class SyncUI: ObservableObject{
    
    private var publicWork: PublicWork
    
    @Published var name: String = ""
    @Published var message = "Conectando ao servidor ..."
    @Published var workerStatus = WorkerStatus.notStarted
    @Published var progress = 0
    var publicWorkUploader: PublicWorkUploadWorker
    
    init(_ publicWork: PublicWork){
        self.publicWork = publicWork
        self.publicWorkUploader = PublicWorkUploadWorker(publicWork.id)
        self.name = publicWork.name
        
        subscribeUploader()
    }
    
    private func subscribeUploader(){
        publicWorkUploader.status.asObservable().subscribe(onNext: { workerStatus, message,progress in
            DispatchQueue.main.async {
                self.message = message
                self.workerStatus = workerStatus
                self.progress = progress
            }
        })
    }
}
