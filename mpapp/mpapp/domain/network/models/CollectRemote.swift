import Foundation

class CollectRemote: Codable{
    var id: String
    var idPublicWork: String
    var userEmail: String
    var comment: String?
    var date: Int64
    var publicWorkStatus: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case idPublicWork = "public_work_id"
        case userEmail = "user_email"
        case comment
        case date
        case publicWorkStatus = "public_work_status"
    }
    
    init(_ jsonData: Data) {
        let collect = try! JSONDecoder().decode(CollectRemote.self, from: jsonData)
        self.id = collect.id
        self.idPublicWork = collect.idPublicWork
        self.userEmail = collect.userEmail
        self.comment = collect.comment
        self.date = collect.date
        self.publicWorkStatus = collect.publicWorkStatus
    }
    
    init(_ collect: Collect) {
        self.id = collect.id
        self.idPublicWork = collect.idPublicWork
        self.userEmail = collect.idUser
        self.comment = collect.comments
        self.date = collect.date
        self.publicWorkStatus = collect.publicWorkStatus
    }
    
    func toParameter() -> Data {
        let jsonData = try! JSONEncoder().encode(self)
        return jsonData
    }
}
