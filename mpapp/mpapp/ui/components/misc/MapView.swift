import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    
    
    @Binding var center: CLLocationCoordinate2D
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var control: MapView
        
        init(_ control: MapView) {
            self.control = control
        }
        
        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            control.center = mapView.camera.target
        }
    }
}



