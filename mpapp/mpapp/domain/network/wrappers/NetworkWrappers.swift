import Foundation
import Promises
import Alamofire

@propertyWrapper
struct GET {
    private var callUrl: String
    private let headers: HTTPHeaders = ["X-TRENA-KEY" : Config.TRENA_KEY]
    
    init(url: String) {
        self.callUrl = url
    }
    
    var wrappedValue : Promise<Data> {
        return Promise(on: .global()){ fulfill, reject in
            AF.request(Config.BASE_URL.appendingPathComponent(self.callUrl),headers: self.headers).responseData { response in
                switch response.result {
                case .success(let data):
                    fulfill(data)
                case .failure(let error):
                    reject(error)
                }
                
            }
        }
    }
}

