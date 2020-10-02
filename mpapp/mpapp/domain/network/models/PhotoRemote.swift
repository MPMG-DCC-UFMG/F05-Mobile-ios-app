import Foundation

class PhotoRemote: Codable{
    var id: String
    var idCollect: String
    var filepath: String
    var comment: String?
    var timestamp: Int64
    var latitude: Double
    var longitude: Double
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case idCollect = "id_collect"
        case filepath
        case comment
        case timestamp
        case latitude
        case longitude
        case type
    }
    
    init(_ photo: Photo, filePath: String) {
        self.id = photo.id
        self.idCollect = photo.idCollect
        self.filepath = filePath
        self.comment = photo.comment
        self.timestamp = photo.timestamp
        self.latitude = photo.latitude
        self.longitude = photo.longitude
        self.type = photo.type!
    }
    
    init(_ jsonData: Data) {
        let photo = try! JSONDecoder().decode(PhotoRemote.self, from: jsonData)
        self.id = photo.id
        self.idCollect = photo.idCollect
        self.filepath = photo.filepath
        self.comment = photo.comment
        self.timestamp = photo.timestamp
        self.latitude = photo.latitude
        self.longitude = photo.longitude
        self.type = photo.type
    }
    
    func toParameter() -> Data {
        let jsonData = try! JSONEncoder().encode(self)
        return jsonData
    }
}
