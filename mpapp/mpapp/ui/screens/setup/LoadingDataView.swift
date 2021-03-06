import SwiftUI
import Resolver

struct LoadingDataView: View {

    @ObservedObject private var configurationViewModel: ConfigurationViewModel = Resolver.resolve()
   
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                TrenaLoading(isLoading: configurationViewModel.workerStatus != WorkerStatus.failed, message: configurationViewModel.message )
                Spacer()
                if configurationViewModel.workerStatus == WorkerStatus.failed{
                    TrenaButton(label: "Tentar novamente",style: .button2){
                        self.startDownload()
                    }
                    TrenaButton(label: "Continuar",style: .button3) {
                        self.moveForward()
                    }.padding(.vertical,15)
                }
            }.padding(.horizontal,20)
        }.onAppear {
            self.startDownload()
        }
    }
    
    private func moveForward(){
        configurationViewModel.moveForward()
    }
    
    private func startDownload(){
        configurationViewModel.startConfigFilesDownload()
    }
}

struct LoadingDataView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingDataView()
    }
}
