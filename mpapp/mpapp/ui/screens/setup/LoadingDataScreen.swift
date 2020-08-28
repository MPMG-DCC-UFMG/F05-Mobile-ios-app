import SwiftUI
import Resolver

struct LoadingDataScreen: View {
    
   @ObservedObject private var configurationViewModel: ConfigurationViewModel = Resolver.resolve()
        
    var body: some View {
        VStack{
            if configurationViewModel.workerStatus == WorkerStatus.SUCCESS{
                HomeView()
                    .transition(AnyTransition.opacity)
                    .animation(.default)
            }else{
                LoadingDataView()
            }
        }
        
    }
}

struct LoadingDataScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingDataScreen()
    }
}
