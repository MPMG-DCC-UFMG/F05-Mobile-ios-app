import SwiftUI

struct PublicWorkMapListView: View {
    
    @ObservedObject var publicWorkViewModel: PublicWorkViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PublicWorkMapListView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkMapListView(publicWorkViewModel: PublicWorkViewModel(publicWorkRepository: PublicWorkRepository(localPublicWorkDataSource: LocalPublicWorkDataSource(), remotePublicWorkDataSource: RemotePublicWorkDataSource()), typeWorkRepository: TypeWorkRepository(localTypeWorkDataSource: LocalTypeWorkDataSource())))
    }
}
