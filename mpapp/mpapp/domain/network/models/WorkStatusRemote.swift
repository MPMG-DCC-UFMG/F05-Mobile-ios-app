import Foundation
import Gloss

class WorkStatusRemote: JSONDecodable{
    let name: String?
    let flag: Int?
    let comments: String?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.flag = "flag" <~~ json
        self.comments = "description" <~~ json
    }
    
    func toWorkStatusDB() -> WorkStatus{
        let workStatus =  WorkStatus()
        workStatus.flag = self.flag!
        workStatus.name = self.name!
        workStatus.comment = self.comments
        return workStatus
    }
}
