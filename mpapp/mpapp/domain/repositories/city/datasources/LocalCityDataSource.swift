import Foundation
import RealmSwift

class LocalCityDataSource: BaseDataSource<City>, ILocalCityDataSource{
    
    func insertCity(city: City) throws {
        try self.insert(entity: city)
    }
    
    func insertCities(cities: Array<City>) throws {
        try self.insertAll(entities: cities)
    }
    
    func listCities() -> Results<City> {
        return self.listAll()
    }
}
