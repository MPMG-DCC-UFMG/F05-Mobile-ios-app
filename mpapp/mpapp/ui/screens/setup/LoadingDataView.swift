import SwiftUI

struct LoadingDataView: View {
    
    @State var loadingMessage: String = "Iniciando ..."
    @ObservedObject var loadServerDataWorker = LoadServerDataWorker()
    
    var body: some View {
        VStack{
            if loadServerDataWorker.workerStatus == WorkerStatus.SUCCESS{
                ContentView()
            }else{
                Text(loadServerDataWorker.workerMessage)
            }
        }.onAppear {
            self.startDownload()
        }
    }
    
    private func startDownload(){
        loadServerDataWorker.execute()
    }
}

struct LoadingDataView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingDataView()
    }
}
