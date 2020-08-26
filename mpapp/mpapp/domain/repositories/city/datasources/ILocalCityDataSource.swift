import Foundation
import RealmSwift

protocol ILocalCityDataSource {
    func insertCity(city: City) throws

    func insertCities(cities: Array<City>) throws
    
    func listCities() -> Results<City>

    func deleteCities() throws
}
