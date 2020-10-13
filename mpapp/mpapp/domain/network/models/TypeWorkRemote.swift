import Foundation

class TypeWorkRemote: Decodable{
    var name: String
    var flag: Int
    var statusList: [Int]
    
    enum CodingKeys: String, CodingKey {
        case name
        case flag
        case statusList = "status_list"
    }
    
    init(_ jsonData: Data) {
        let response = try! JSONDecoder().decode(TypeWorkRemote.self, from: jsonData)
        self.name = response.name
        self.flag = response.flag
        self.statusList = response.statusList
    }
    
    func toTypeWorkDB() -> TypeWork{
        let typeWork =  TypeWork()
        let parsedList = self.statusList.map{String($0)}
        typeWork.flag = self.flag
        typeWork.name = self.name
        typeWork.status = parsedList.joined(separator: ",")
        return typeWork
    }
}
