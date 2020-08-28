import Foundation
import Alamofire
import PromiseKit

struct MPApi{
    
    private init(){}
    
    @GET(url: "typeworks/") static var loadTypeWorks : (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "typeworks/version") static var getTypeWorkVersion: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "typephotos/") static var loadTypePhotos: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "typephotos/version") static var getTypePhotosVersion: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "association/tptw/all") static var loadAssociation: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "association/tptw/version") static var getAssociationsVersion: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "workstatus/")static var loadWorkStatus: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "workstatus/version") static var getWorkStatusVersion: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "address/city/version")static var  getCitiesVersion: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "address/city/all") static var loadCities: (_ queryParameters: Parameters?) -> Promise<Data>
    
    @GET(url: "publicworks/version") static var getPublicWorkVersion: (_ queryParameters: Parameters?) -> Promise<Data>

    @GET(url: "publicworks/changes") static var loadPublicWorksChange: (_ queryParameters: Parameters?) -> Promise<Data>
}
