import Foundation
import Alamofire
import PromiseKit
import SwiftUI

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
    
    @POST(url: "security/users/create") static var createUser : (_ body: Data) -> Promise<Data>
    
    @POST(url: "queue/photo/add") static var sendPhoto: (_ body: Data) -> Promise<Data>
    
    @POST(url: "queue/publicwork/add") static var sendPublicWork: (_ body: Data) -> Promise<Data>
    
    @POST(url: "queue/collect/add") static var sendCollect: (_ body: Data) -> Promise<Data>
    
    @UPLOAD(url: "images/upload") static var sendImage: (_ image: UIImage, _ imageName: String) -> Promise<Data>
    
    @LOGIN(url: "security/users/login") static var login: (_ username: String, _ password: String) -> Promise<Data>
}
