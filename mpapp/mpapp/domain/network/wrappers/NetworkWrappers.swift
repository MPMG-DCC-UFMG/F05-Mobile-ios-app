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

@propertyWrapper
struct LOGIN{
    private var callUrl: String
    private let headers: HTTPHeaders = ["X-TRENA-KEY" : Config.trenaKey,"Content-Type":"application/x-www-form-urlencoded"]
    
    init(url: String) {
        self.callUrl = url
    }
    
    var wrappedValue : (_ username: String, _ password: String) -> Promise<Data> {
        return {username, password in
            Promise { seal in
                let parameters = ["username": username, "password":password]
                AF.request(Config.baseURL.appendingPathComponent(self.callUrl), method: .post,parameters: parameters,headers: headers).responseData { response in
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
struct UPLOAD {
    private var callUrl: String
    private let headers: HTTPHeaders = ["X-TRENA-KEY" : Config.trenaKey]
    
    init(url: String) {
        self.callUrl = url
    }
    
    var wrappedValue : (_ image: UIImage,_ imageName: String) -> Promise<Data> {
        return {image, imageName in
            Promise { seal in
                let imageData = image.jpegData(compressionQuality: 0.5)                
                AF.upload(multipartFormData: {multipartFormData in
                    multipartFormData.append(imageData!, withName: "file", fileName: "\(imageName)", mimeType: "image/png")
                },to: Config.baseURL.appendingPathComponent(self.callUrl), method: .post , headers: headers).responseData{response in
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



