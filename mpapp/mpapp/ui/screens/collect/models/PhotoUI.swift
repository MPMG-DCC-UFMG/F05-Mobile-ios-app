import Foundation
import SwiftUI
import CoreLocation

class PhotoUI: ObservableObject,Identifiable{
    var date = Date().currentTimeMillis()
    @Published var comments: String? = nil
    @Published var typePhotoName: String? = nil
    var idCollect: String = ""
    @Published var fileName: String? = nil
    var latitude : Double = 0.0
    var longitude: Double = 0.0
    @Published var uiImage: UIImage? = nil
    
    private var photo: Photo = Photo()
    
    init(_ photo: Photo = Photo()) {
        self.photo = photo
        comments = photo.comment
        idCollect = photo.idCollect
        fileName = photo.fileName
        typePhotoName = photo.type
        latitude = photo.latitude
        longitude = photo.longitude
        uiImage = loadImage()
    }
    
    func updateTypePhoto(_ typePhoto: TypePhoto){
        self.typePhotoName = typePhoto.name
    }
    
    func getId() -> String{
        return photo.id
    }
    
    func updateLocation(_ location: CLLocation?){
        guard let coordinate = location?.coordinate else {
            return
        }
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
    
    func toDB() -> Photo{
        photo.comment = comments
        photo.fileName = fileName
        photo.type = typePhotoName
        photo.isSent = false
        photo.idCollect = idCollect
        photo.latitude = latitude
        photo.longitude = longitude
        return photo
    }
    
    func loadImage() -> UIImage? {
        guard let fileName = fileName else{
            return nil
        }
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        }
        return nil
    }
}
