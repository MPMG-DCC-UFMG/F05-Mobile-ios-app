import Foundation


class CollectViewModel: ObservableObject {
    @Published var currentCollect = CollectUI()
    
    private let collectRepository: ICollectRepository
    private let publicWorkRepository: IPublicWorkRepository
    
    init(collectRepository: ICollectRepository,
         publicWorkRepository: IPublicWorkRepository){
        self.collectRepository = collectRepository
        self.publicWorkRepository = publicWorkRepository
    }
    
    func updateCurrentCollect(_ publicWork: PublicWorkUI){
        let collect = collectRepository.getCollectByPublicWorkId(publicWorkId: publicWork.getId())
        if (collect != nil){
            currentCollect = CollectUI(collect!)
        }
    }
    
    func updateComment(_ comment: String){
        currentCollect.comments = comment
    }
    
    func updateCollect(workStatus: WorkStatus, publicWorkUI: PublicWorkUI){
        currentCollect.publicWorkStatus = workStatus.flag
        currentCollect.idPublicWork = publicWorkUI.getId()
        do {
            try collectRepository.insertCollect(collect: currentCollect,publicWork: publicWorkUI.getPublicWork())
        } catch {
            print(error)
        }
    }
    
    func deleteCollect(publicWorkUI: PublicWorkUI){
        do{
            try collectRepository.deleteCollect(collect: currentCollect.getCollect(), publicWork: publicWorkUI.getPublicWork())
        }catch{
            print(error)
        }
    }
}
