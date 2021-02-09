import Foundation
import SwiftUI
import Resolver

class PhotoViewModel: BaseViewModel, ObservableObject{
    
    @Published var currPhoto: PhotoUI = PhotoUI()
    
    private let collectRepository: CollectRepository
    private let typePhotoRepository: TypePhotoRepository

    var typePhotos = [TypePhoto]()
    
    init(collectRepository: CollectRepository, typePhotoRepository: TypePhotoRepository) {
        self.collectRepository = collectRepository
        self.typePhotoRepository = typePhotoRepository
        self.typePhotos = typePhotoRepository.listAllTypePhotos().toArray()
    }
    
    func startPhotoFlow(_ photoId:String? = nil, idCollect: String){
        currPhoto = getPhoto(photoId)
        currPhoto.idCollect = idCollect
    }
    
    private func getPhoto(_ photoId:String? = nil) -> PhotoUI{
        guard let _photoId = photoId else{
            return PhotoUI()
        }
        guard let photo = self.collectRepository.getPhotoById(photoId: _photoId) else {
            return PhotoUI()
        }
        return PhotoUI(photo)
    }
    
    func isPhotoValid() -> Bool{
        return currPhoto.uiImage != nil
    }
    
    func saveCurrPhoto() -> PhotoUI? {
        guard let image = currPhoto.uiImage else {return nil}
        guard let imgPath = saveImage(imageName: "MP_\(currPhoto.getId()).jpg", image: image) else {return nil}
        
        currPhoto.fileName = imgPath
        return currPhoto
    }
    
    private func saveImage(imageName: String, image: UIImage) -> String? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return nil }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
        
        do {
            try data.write(to: fileURL)
            return fileName
        } catch let error {
            print("error saving file with error", error)
            return nil
        }
    }
    
    func navigateBack(){
        self.navController.navigateBack()
    }
}
