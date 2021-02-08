import Foundation
import RealmSwift

class CityRepository{
    
    private let localCityDataSource: LocalCityDataSource
    
    init(localCityDataSource: LocalCityDataSource) {
        self.localCityDataSource = localCityDataSource
    }
    
    func insertCity(city: City) throws {
        try self.localCityDataSource.insertCity(city: city)
    }
    
    func insertCities(cities: Array<City>) throws {
        try self.localCityDataSource.insertCities(cities: cities)
    }
    
    func listCities() -> Results<City> {
        return self.localCityDataSource.listCities()
    }

    func deleteCities() throws {
        try self.localCityDataSource.deleteCities()
    }
}
