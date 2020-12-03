import Foundation
import PromiseKit

class RemotePhotoDataSource: IRemotePhotoDataSource{
    
    func sendImage(imageName: String) -> Promise<ImageUploadResponse>{
        return Promise { seal in
            guard let image = loadImage(imageName) else {
                seal.reject(NSError())
                return
            }
            firstly{
                MPApi.sendImage(image,imageName)
            }.done{data in
                seal.fulfill(ImageUploadResponse(data))
            }
        }
    }
    
    func sendPhoto(photo: PhotoRemote) -> Promise<ResponseRemote>{
        return firstly{
            MPApi.sendPhoto(photo.toParameter())
        }.map{ data in
            ResponseRemote(data)
        }
    }
    
    private func loadImage(_ fileName: String) -> UIImage? {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        }
        return nil
    }
}
