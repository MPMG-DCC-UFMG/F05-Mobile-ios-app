import Foundation


class CollectViewModel: ObservableObject {
    @Published var currentCollect = CollectUI()
    @Published var photoList : [String:PhotoUI] = [:]
    
    private let collectRepository: ICollectRepository
    private let publicWorkRepository: IPublicWorkRepository
    
    init(collectRepository: ICollectRepository,
         publicWorkRepository: IPublicWorkRepository){
        self.collectRepository = collectRepository
        self.publicWorkRepository = publicWorkRepository
    }
    
    func updateCurrentCollect(_ publicWork: PublicWorkUI){
        photoList = [:]
        guard let idCollect = publicWork.idCollect else {
            currentCollect = CollectUI()
            return
        }
        
        guard let collect = collectRepository.getCollectByCollectId(collectId: idCollect) else {
            currentCollect = CollectUI()
            return
        }
        
        currentCollect = CollectUI(collect)
        fetchPhotoList(collect.id)
    }
    
    private func fetchPhotoList(_ collectId: String){
        photoList = Dictionary(uniqueKeysWithValues: collectRepository.getPhotoByCollectId(collectId: collectId).map{ ($0.id, PhotoUI($0)) })
    }
    
    func updateComment(_ comment: String){
        currentCollect.comments = comment
    }
    
    func updateCollect(workStatus: WorkStatus?, publicWorkUI: PublicWorkUI){
        if(workStatus != nil){
            currentCollect.publicWorkStatus = workStatus!.flag
        }
        currentCollect.idPublicWork = publicWorkUI.getId()
        do {
            try collectRepository.insertCollect(collect: currentCollect,publicWork: publicWorkUI.getPublicWork(),photoUI:photoList.map{$0.value})
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
    
    func addPhotoToList(photo: PhotoUI){
        photoList[photo.getId()] = photo
    }
    
    func removePhotoFromList(_ photo : PhotoUI){
        do{
            photoList.removeValue(forKey: photo.getId())
            try collectRepository.deletePhotoById(photo.getId())
            deleteImage(fileName: photo.fileName)
        }catch{
            print(error)
        }
    }
    
    private func deleteImage(fileName: String?) {
        guard let fileName = fileName else {return}
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
    }
}
