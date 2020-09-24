import Foundation
import SwiftUI
import Resolver

class PhotoViewModel: ObservableObject{
    
    @Published var currPhoto: PhotoUI = PhotoUI()
    
    func startPhotoFlow(_ photo:PhotoUI = PhotoUI(), idCollect: String){
        currPhoto = photo
        currPhoto.idCollect = idCollect
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
    
    
}
