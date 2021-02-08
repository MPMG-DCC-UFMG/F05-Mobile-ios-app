import Foundation
import GoogleMaps

class LocationViewModel:BaseViewModel,ObservableObject{
    
    private let geocoder = GMSGeocoder()
    @Published var address = Address()
    @Published var addressString = ""
    
    func findAddress(coordinate:CLLocationCoordinate2D){
        geocoder.reverseGeocodeCoordinate(coordinate){response, error in
            guard let foundAddress = response?.firstResult() else{
                    return
            }
            let lines = foundAddress.lines!
            self.addressString = lines.joined(separator: "\n")

            let newAddress = Address()
            newAddress.cep = foundAddress.postalCode ?? ""
            newAddress.city = foundAddress.locality ?? self.getCity(line: self.addressString)
            newAddress.neighborhood = foundAddress.subLocality ?? ""
            newAddress.latitude = coordinate.latitude
            newAddress.longitude = coordinate.longitude
            guard var numberStreet = foundAddress.thoroughfare?.split(separator: " ") else{
                self.address = newAddress
                return
            }
            newAddress.number = String(numberStreet.first ?? "")
            numberStreet.remove(at: 0)
            newAddress.street = numberStreet.joined(separator: " ")
            self.address = newAddress
        }
    }
    
    private func getCity(line: String) -> String {
        let arr = line.split(separator: ",")
        if(arr.capacity < 2){
            return ""
        }
        let city = arr[2].split(separator: "-")
        
        return String(city[0])
    }
    
    func navigateBack(){
        self.navController.navigateBack()
    }
    
}
