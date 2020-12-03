import Foundation
import Alamofire

class NetworkSession{
    //    trena.gsi.mpmg.mp.br
    static let APIManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        let manager = ServerTrustManager(evaluators: ["trena.gsi.mpmg.mp.br": DisabledTrustEvaluator()])
        let session = Session.init(configuration: configuration,
                                   serverTrustManager: manager)
        return session
    }()

}
