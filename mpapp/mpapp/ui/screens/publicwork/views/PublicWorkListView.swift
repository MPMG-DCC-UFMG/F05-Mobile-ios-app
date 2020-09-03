import SwiftUI
import Resolver

struct PublicWorkListView: View {
    
    @ObservedObject var publicWorkViewModel: PublicWorkViewModel = Resolver.resolve()
    @State private var searchTerm: String = ""
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                SearchField(placeHolder: "Pesquise por alguma obra especifíca",input: $searchTerm)
                Text("Lista de obras")
                    .h1()
                    .padding(.top,20)
                List{
                    ForEach(publicWorkViewModel.publicWorksList(searchTerm: searchTerm)){ publicWork in
                        PublicWorkListItem(publicWork: publicWork)
                    }
                    .listRowBackground(ColorProvider.darkBackground)
                }
                .onAppear { UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().bounces = false
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
                .onDisappear {
                    UITableView.appearance().separatorStyle = .singleLine
                    
                }
                .padding(.horizontal, -20)
                .listStyle(PlainListStyle())
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
