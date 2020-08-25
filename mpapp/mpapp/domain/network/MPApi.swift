import Foundation
import Promises

struct MPApi{
    
    private init(){}
    
    @GET(url: "typeworks/") static var loadTypeWorks : Promise<Data>
    
    @GET(url: "typeworks/version") static var getTypeWorkVersion: Promise<Data>
}
