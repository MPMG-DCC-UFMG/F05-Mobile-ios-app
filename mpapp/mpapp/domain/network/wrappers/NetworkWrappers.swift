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

@propertyWrapper
struct POST {
    private var callUrl: String
    private let headers: HTTPHeaders = ["X-TRENA-KEY" : Config.trenaKey]
    
    init(url: String) {
        self.callUrl = url
    }
    
    var wrappedValue : (_ body: Data) -> Promise<Data> {
        return {body in
            Promise { seal in
                var request = URLRequest(url: Config.baseURL.appendingPathComponent(self.callUrl))
                request.httpMethod = HTTPMethod.post.rawValue
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = body
                request.headers = self.headers
                AF.request(request).responseData { response in
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

