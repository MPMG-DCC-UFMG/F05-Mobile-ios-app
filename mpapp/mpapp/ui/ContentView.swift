import SwiftUI
import Resolver

struct ContentView: View {
    @ObservedObject private var navController : NavController = Resolver.resolve()
    
    var body: some View {
        ZStack{
            navController.currentView.transition(AnyTransition.opacity)
                .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
