import Foundation
import Resolver
import RxSwift
import PromiseKit

class PublicWorkUploadWorker: ObservableObject{
    
    private let publicWorkRepository: IPublicWorkRepository = Resolver.resolve()
    private let collectRepository: ICollectRepository = Resolver.resolve()
    
    let status = PublishSubject<(WorkerStatus,String,Int)>()
    
    private var workerStatus: WorkerStatus = WorkerStatus.notStarted
    private var workerMessage: String = "Conectando ao servidor..."
    private var workerProgress: Int = 0
    
    var publicWorkId:String
    
    init(_ publicWorkId: String) {
        self.publicWorkId = publicWorkId
    }
    
    func execute(){
        if(workerStatus == .success || workerStatus == .running){
            return
        }
        
        workerStatus = .running
        
        guard let publicWork = publicWorkRepository.getPublicWorkById(publicWorkId: self.publicWorkId) else{
            updateStatus(status: .failed, message: "Não foi possível encontrar a obra",progress: 0)
            return
        }
        
        self.updateProgress(message: "Enviando novos dados da obra",progress: 10)
        if(publicWork.toSend){
            firstly{
                publicWorkRepository.sendPublicWork(publicWorkRemote: PublicWorkRemote(publicWork))
            }.done{ responseRemote in
                try self.publicWorkRepository.markPublicWorkSent(publicWorkId: publicWork.id)
                self.sendCollect(publicWork: publicWork)
            }.catch{error in
                self.updateStatus(status: .failed, message: "Não foi possível atualizar a obra",progress: 0)
                return
            }
        }else{
            sendCollect(publicWork: publicWork)
        }
    }
    
    private func sendCollect(publicWork: PublicWork){
        if(publicWork.idCollect != nil){
            guard let collect = collectRepository.getCollectByCollectId(collectId: publicWork.idCollect!) else {
                updateStatus(status: .failed, message: "Não foi possível encontrar a coleta",progress: 0)
                return
            }
            
            self.updateProgress(message: "Enviando dados da coleta",progress: 30)
            firstly{
                self.collectRepository.sendCollect(collectRemote: CollectRemote(collect))
            }.then {responseRemote in
                self.sendCollectPhotos(collectId: collect.id)
            }.done{ sent in
                if(sent){
                    try self.publicWorkRepository.markPublicWorkCollectSent(publicWorkId: publicWork.id)
                    self.updateStatus(status: .success, message: "Dados enviados com sucesso",progress: 100)
                }else{
                    self.updateStatus(status: .failed, message: "Não foi possível enviar coleta",progress: 0)
                }
            }.catch{ error in
                self.updateStatus(status: .failed, message: "Não foi possível enviar coleta",progress: 0)
            }
        }else{
            self.updateProgress(message: "Dados enviados com sucesso",progress: 100)
        }
    }
    
    private func sendCollectPhotos(collectId: String) -> Promise<Bool>{
        return Promise{ seal in
            let photos = collectRepository.getPhotoByCollectId(collectId: collectId)
            var allPhotosSent = true
            
            photos.forEach{ photo in
                self.updateProgress(message: "Enviando dados da foto",progress: 50)
                firstly{
                    self.collectRepository.sendImage(imageName: photo.fileName!)
                }.then{ imageResponse in
                    self.collectRepository.sendPhoto(photo: PhotoRemote(photo,filePath: imageResponse.filepath))
                }.done{ responseRemote in
                    allPhotosSent = allPhotosSent && responseRemote.success
                }.catch{ error in
                    allPhotosSent = false
                }
            }
            
            seal.fulfill(allPhotosSent)
        }
    }

    private func updateProgress(message: String,progress: Int){
        self.workerMessage = message
        self.workerProgress = progress
        notify()
    }
    
    private func updateStatus(status: WorkerStatus, message:String = "",progress: Int){
        self.workerStatus = status
        self.workerMessage = message
        self.workerProgress = progress
        notify()
    }
    
    private func notify(){
        self.status.onNext((self.workerStatus, self.workerMessage,self.workerProgress))
    }
}
