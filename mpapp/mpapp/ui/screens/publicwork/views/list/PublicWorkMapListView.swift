import SwiftUI
import CoreLocation


struct PublicWorkMapListView: View {
    
    @ObservedObject var publicWorkViewModel: PublicWorkViewModel
    
    @State private var centerOfMap = CLLocationCoordinate2D()
    
    var body: some View {
        MapView(center: $centerOfMap, locationEnabled: true, markers: getMarkers())
    }
    
    private func getMarkers() -> [PublicWorkMapMarker]{
        return publicWorkViewModel.publicWorksList().map{PublicWorkMapMarker($0)}
    }
}

struct PublicWorkMapListView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkMapListView(publicWorkViewModel: PublicWorkViewModel(publicWorkRepository: PublicWorkRepository(localPublicWorkDataSource: LocalPublicWorkDataSource(), remotePublicWorkDataSource: RemotePublicWorkDataSource()), typeWorkRepository: TypeWorkRepository(localTypeWorkDataSource: LocalTypeWorkDataSource())))
    }
}
