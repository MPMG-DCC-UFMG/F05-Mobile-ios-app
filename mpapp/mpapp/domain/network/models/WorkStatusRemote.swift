import Foundation

class WorkStatusRemote: Decodable{
    var name: String
    var flag: Int
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case flag
        case description
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(WorkStatusRemote.self, from: jsonData)
        self.name = response.name
        self.flag = response.flag
        self.description = response.description
    }
    
    func toWorkStatusDB() -> WorkStatus{
        let workStatus =  WorkStatus()
        workStatus.flag = self.flag
        workStatus.name = self.name
        workStatus.comment = self.description
        return workStatus
    }
}
