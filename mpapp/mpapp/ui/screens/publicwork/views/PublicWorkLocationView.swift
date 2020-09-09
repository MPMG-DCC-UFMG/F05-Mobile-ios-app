import SwiftUI
import Resolver
import CoreLocation

struct PublicWorkLocationView: View {
    
    @ObservedObject private var locationViewModel: LocationViewModel = Resolver.resolve()
    
    private let locationManager: LocationManager = Resolver.resolve()
    var onCancelClicked: (() -> Void)? = nil
    var onConfirmClicked: ((_ address: Address) ->Void)? = nil
    
    @State private var centerOfMap = CLLocationCoordinate2D()
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    MapView(center: $centerOfMap).edgesIgnoringSafeArea(.all)
                    Image("marker")
                        .imageStyle()
                        .frame(width: 50, height: 50)
                        .padding(.bottom,12)
                }
                TrenaTextWithAction(placeHolder: "Atualizar localização ...", input: locationViewModel.addressString,action:findLocation)
                    .padding(.horizontal)
                TrenaButton(label: "Confirmar localização", style: .button2, action: {
                    self.handleCompleteClicked()
                }).padding(.horizontal,25)
                    .padding(.top,15)
                TrenaButton(label: "Cancelar", style: .button4, action: {
                    self.onCancelClicked?()
                }).padding(.horizontal,25)
                    .padding(.vertical,15)
                
            }
        }
    }
    
    private func handleCompleteClicked(){
        self.onConfirmClicked?(locationViewModel.address)
        self.onCancelClicked?()
    }
    
    private func findLocation(){
        self.locationViewModel.findAddress(coordinate: self.centerOfMap)
    }
}

struct PublicWorkLocationView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkLocationView()
    }
}
