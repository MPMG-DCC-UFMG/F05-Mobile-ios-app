import Foundation
import CoreLocation

class LocationManager: NSObject,ObservableObject{
    
    @Published var status: CLAuthorizationStatus? = nil
    @Published var location: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }
    
    var latitude: CLLocationDegrees {
        return location?.coordinate.latitude ?? -19.8157
    }
    
    var longitude: CLLocationDegrees {
        return location?.coordinate.longitude ?? -43.9542
    }
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}
