import Foundation
import Alamofire
import PromiseKit

@propertyWrapper
struct GET {
    private var callUrl: String
    private let headers: HTTPHeaders = ["X-TRENA-KEY" : Config.trenaKey]
    
    init(url: String) {
        self.callUrl = url
    }
    
    var wrappedValue : (_ queryParameters: Parameters?) -> Promise<Data> {
        return {queryParameters in
            Promise { seal in
                AF.request(Config.baseURL.appendingPathComponent(self.callUrl),parameters: queryParameters, headers: self.headers).responseData { response in
                    switch response.result {
                    case .success(let data):
                        seal.fulfill(data)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
            }
        }
    }
}

