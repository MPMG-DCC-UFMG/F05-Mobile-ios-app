import Foundation
import Promises

struct MPApi{
    
    private init(){}
    
    @GET(url: "typeworks/") static var loadTypeWorks : Promise<Data>
    
    @GET(url: "typeworks/version") static var getTypeWorkVersion: Promise<Data>
    
    @GET(url: "typephotos/") static var loadTypePhotos: Promise<Data>
    
    @GET(url: "typephotos/version") static var getTypePhotosVersion: Promise<Data>
    
    @GET(url: "association/tptw/all") static var loadAssociation: Promise<Data>
    
    @GET(url: "association/tptw/version") static var getAssociationsVersion: Promise<Data>
    
    @GET(url: "workstatus/")static var loadWorkStatus: Promise<Data>
    
    @GET(url: "workstatus/version") static var getWorkStatusVersio: Promise<Data>
    
    @GET(url: "address/city/version")static var  getCitiesVersion: Promise<Data>
    
    @GET(url: "address/city/all") static var loadCities: Promise<Data>
}
