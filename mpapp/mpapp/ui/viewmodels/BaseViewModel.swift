import Foundation
import Resolver

class BaseViewModel {
    
    lazy var navController : NavController = Resolver.resolve()
}
