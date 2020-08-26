import Foundation
import Resolver
import Promises
import Gloss

protocol BaseDownloadInfo {
    func name() -> String
    func currentVersion() -> Int
    func serverVersion() -> Promise<EntityVersion>
    func updateCurrentVersion(serverVersion: Int)
    func loadInfo() -> Promise<Array<JSONDecodable>>
    func onSuccess(list: Array<Any>) -> Bool
}
