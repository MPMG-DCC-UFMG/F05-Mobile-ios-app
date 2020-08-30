import SwiftUI
import Resolver

struct PublicWorkListView: View {
    
    @ObservedObject var publicWorkViewModel: PublicWorkViewModel = Resolver.resolve()
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                SearchField(placeHolder: "Pesquise por alguma obra especifíca")
                Text("Lista de obras")
                    .h1()
                    .padding(.top,20)
                List{
                    ForEach(publicWorkViewModel.publicWorks){ publicWork in
                        PublicWorkListItem(publicWork: publicWork)
                    }
                    .listRowBackground(ColorProvider.darkBackground)
                }
                    .onAppear { UITableView.appearance().separatorStyle = .none
                        UITableView.appearance().bounces = false
                }
                    .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
                .padding(.horizontal, -20)
                .listStyle(PlainListStyle())
                Spacer()
            }
            .padding(.horizontal,15)
            .padding(.top,10)
        }
    }
}

struct PublicWorkListView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkListView()
    }
}
