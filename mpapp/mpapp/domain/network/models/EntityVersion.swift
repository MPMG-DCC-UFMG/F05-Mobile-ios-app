import Foundation
import Gloss

class EntityVersion: JSONDecodable{
    var version: Int?
    
    required init?(json: JSON) {
        self.version = "version" <~~ json
    }
    
    init() {
        version = -1
    }
}
