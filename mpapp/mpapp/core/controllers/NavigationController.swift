import Foundation
import SwiftUI

class NavController: ObservableObject{
    
    private var backStack: [AnyView] = []
    
    @Published var currentView: AnyView
    
    init(firstView: AnyView = AnyView(SplashView())) {
        currentView = firstView
        backStack.append(firstView)
    }
    
    func navigateBack(){
        DispatchQueue.main.async{
            if self.backStack.count > 1 {
                self.backStack.popLast()
                self.currentView = self.backStack.last!
            }
        }
    }
    
    func navigateTo(_ to: AnyView){
        DispatchQueue.main.async {
            self.backStack.append(to)
            self.currentView = to
        }
    }
    
    func replaceTop(_ to: AnyView){
        DispatchQueue.main.async {
            self.backStack.popLast()
            self.backStack.append(to)
            self.currentView = to
        }
    }
}
