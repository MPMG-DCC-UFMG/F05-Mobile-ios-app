import SwiftUI
import Resolver

struct SyncView: View {
    
    @ObservedObject var syncViewModel: SyncViewModel = Resolver.resolve()
    
    var onBackPressed: (() -> Void)?
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                TrenaTopBar(title: "Enviar dados", onBackPressed: self.onBackPressed).padding(.bottom,15)
                List{
                    ForEach(syncViewModel.publicWorksList()){ publicWork in
                        SyncListItem(syncUI: SyncUI(publicWork))
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
                TrenaButton(label: "Enviar dados", style: .button2, action: {})
                    .padding()
            }
        }
    }
}

struct SyncView_Previews: PreviewProvider {
    static var previews: some View {
        SyncView()
    }
}
