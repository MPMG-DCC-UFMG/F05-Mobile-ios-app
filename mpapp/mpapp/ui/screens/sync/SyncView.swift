import SwiftUI
import Resolver

struct SyncView: View {
    
    @ObservedObject var syncViewModel: SyncViewModel = Resolver.resolve()
        
    var body: some View {
        
        let sortedPublicWorks = syncViewModel.syncWorkers.sorted(by: { $0.key < $1.key })
        
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                TrenaTopBar(title: "Enviar dados", onBackPressed: {
                    syncViewModel.navigateBack()
                }).padding(.bottom,15)
                if(sortedPublicWorks.isEmpty){
                    EmptyListView(emptyMessage: "Lista de dados para enviar vazia, tente realizar coletas ou atualizar informações das obras")
                }else{
                    List{
                        ForEach(sortedPublicWorks,id: \.key){ (key, value) in
                            SyncListItem(syncUI:value)
                        }
                        .listRowBackground(ColorProvider.darkBackground)
                    }
                    .onAppear {
                        UITableView.appearance().separatorStyle = .none
                        UITableView.appearance().bounces = false
                        UITableView.appearance().backgroundColor = UIColor.clear
                    }
                    .onDisappear {
                        UITableView.appearance().separatorStyle = .singleLine
                    }
                    .padding(.horizontal, -20)
                    .listStyle(PlainListStyle())
                    TrenaButton(label: "Enviar dados", style: .button2, action: sendClicked)
                        .padding()
                }
            }.onAppear{
                syncViewModel.loadPublicWorksList()
            }
        }
    }
    
    private func sendClicked(){
        syncViewModel.startSyncPublicWorks()
    }
}

struct SyncView_Previews: PreviewProvider {
    static var previews: some View {
        SyncView()
    }
}
