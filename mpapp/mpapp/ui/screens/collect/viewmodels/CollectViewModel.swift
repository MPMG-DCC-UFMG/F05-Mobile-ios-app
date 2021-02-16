import Foundation
import SwiftUI

class CollectViewModel: BaseViewModel,ObservableObject {
    @Published var currentCollect = CollectUI()
    @Published var photoList : [String:PhotoUI] = [:]
        
    private let collectRepository: CollectRepository
    private let publicWorkRepository: PublicWorkRepository
    private let typeWorkRepository: TypeWorkRepository
    private let workStatusRepository: WorkStatusRepository
    
    @Published var publicWork: PublicWorkUI? = nil
    
    init(collectRepository: CollectRepository,
         publicWorkRepository: PublicWorkRepository,
         typeWorkRepository: TypeWorkRepository,
         workStatusRepository: WorkStatusRepository){
        self.collectRepository = collectRepository
        self.publicWorkRepository = publicWorkRepository
        self.typeWorkRepository = typeWorkRepository
        self.workStatusRepository = workStatusRepository
    }
    
    func getWorkStatusesForPublicWork() -> [WorkStatus]{
        guard let _publicWork = publicWork?.getPublicWork() else {
            return []
        }
        guard let typeWork = typeWorkRepository.getTypeWorkByFlag(typeWorkFlag: _publicWork.typeWorkFlag) else {
            return []
        }
        let workStatuses = typeWork.getWorkStatusIds()
        return workStatusRepository.listWorKStatusByFlags(workStatusFlags: workStatuses).toArray()
    }
    
    func setPublicWork(publicWorkId: String){
        guard let publicWork = publicWorkRepository.getPublicWorkById(publicWorkId: publicWorkId) else{
            return
        }
        
        let _publicWorkUi = PublicWorkUI(publicWork)
        self.publicWork = _publicWorkUi
        updateCurrentCollect(_publicWorkUi)
    }
    
    private func updateCurrentCollect(_ publicWork: PublicWorkUI){
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
            self.photoList =   Dictionary(uniqueKeysWithValues: self.collectRepository.getPhotoByCollectId(collectId: collectId).map{ ($0.id, PhotoUI($0)) })
    }
    
    func updateComment(_ comment: String){
        currentCollect.comments = comment
    }
    
    func updateCollect(workStatus: WorkStatus?){
        guard let _publicWork = publicWork else{
            return
        }
        if(workStatus != nil){
            currentCollect.publicWorkStatus = workStatus!.flag
        }
        currentCollect.idPublicWork = _publicWork.getId()
        do {
            try collectRepository.insertCollect(collect: currentCollect,publicWork: _publicWork.getPublicWork(),photoUI:photoList.map{$0.value})
        } catch {
            print(error)
        }
    }
    
    func deleteCollect(){
        guard let _publicWork = publicWork?.getPublicWork() else{
            return
        }
        do{
            try collectRepository.deleteCollect(collect: currentCollect.getCollect(), publicWork: _publicWork)
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
    
    func navigateToPhoto(_ photoId: String? = nil){
        self.navController.navigateTo(AnyView(
            PhotoView(collectId: self.currentCollect.getId(),
                      photoId: photoId,
                      onAddPhoto: { photo in
                        self.addPhotoToList(photo: photo)
                      }, onDeletePhoto: { photo in
                        self.removePhotoFromList(photo)
                      }
            ))
        )
    }
    
    func navigateBack(){
        self.navController.navigateBack()
    }
    
    func editPublicWork(){
        guard let _publicWork = publicWork?.getPublicWork() else{
            return
        }
        self.navController.navigateTo(AnyView(PublicWorkAddView(screenTitle: "Editar obra", publicWorkId: _publicWork.id)))
    }
}
