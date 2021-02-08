import SwiftUI
import Resolver

struct PublicWorkListView: View {
    
    @ObservedObject var publicWorkViewModel: PublicWorkViewModel
        
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                SearchField(placeHolder: "Pesquise por alguma obra especifíca",input: $publicWorkViewModel.searchTerm)
                Text("Lista de obras")
                    .h1()
                    .padding(.top,20)
                if(publicWorkViewModel.publicWorksList().isEmpty){
                    EmptyListView(emptyMessage: "Lista de obras vazia, tente adicionar uma nova obra manualmente.")
                }else{
                    List{
                        ForEach(publicWorkViewModel.publicWorksList()){ publicWork in
                            Button(action: {
                                    self.onPublicWorkClicked(publicWork)}){
                                PublicWorkListItem(publicWork: PublicWorkUI(publicWork))
                            }
                        }
                        .listRowBackground(ColorProvider.darkBackground)
                    }
                    .animation(nil)
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
                }
            }
            .padding(.horizontal,15)
            .padding(.top,10)
        }
    }
    
    private func onPublicWorkClicked(_ publicWork: PublicWork){
        
    }
}

struct PublicWorkListView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkListView(publicWorkViewModel: PublicWorkViewModel(publicWorkRepository: PublicWorkRepository(localPublicWorkDataSource: LocalPublicWorkDataSource(), remotePublicWorkDataSource: RemotePublicWorkDataSource()), typeWorkRepository: TypeWorkRepository(localTypeWorkDataSource: LocalTypeWorkDataSource())))
    }
}
