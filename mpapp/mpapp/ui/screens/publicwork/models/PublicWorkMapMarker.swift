import Foundation
import GoogleMaps

class PublicWorkMapMarker: GMSMarker{
        
    init(_ publicWork: PublicWork){
        super.init()
        if let address = publicWork.address {
            self.position = CLLocationCoordinate2D(latitude: address.latitude, longitude: address.longitude)
        }
        self.snippet = publicWork.address?.formatedAddress()
        self.title = publicWork.name
    }
}
