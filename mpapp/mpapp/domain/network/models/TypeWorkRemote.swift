import Foundation
import Gloss

class TypeWorkRemote: JSONDecodable{
    let name: String?
    let flag: Int?
    let statusList: [Int]?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.flag = "flag" <~~ json
        self.statusList = "status_list" <~~ json
    }
    
    func toTypeWorkDB() -> TypeWork{
        let typeWork =  TypeWork()
        let parsedList = self.statusList!.map{String($0)}
        typeWork.flag = self.flag!
        typeWork.name = self.name!
        typeWork.status = parsedList.joined(separator: ",")
        return typeWork
    }
}
