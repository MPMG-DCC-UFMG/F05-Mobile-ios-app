import Foundation

class ImageUploadResponse: Decodable{
    var filepath: String
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(ImageUploadResponse.self, from: jsonData)
        self.filepath = response.filepath
    }
}
