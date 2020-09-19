import SwiftUI
import Resolver
import CoreLocation

struct PublicWorkListItem: View {
    var publicWork: PublicWorkUI
    
    @ObservedObject private var locationManager: LocationManager = Resolver.resolve()
    
    var body: some View {
        VStack{
            HStack{
                Text("\(publicWork.name)").h2()
                Spacer()
                Text(getDistance(location: locationManager.location)).h3().padding(.trailing,5)
            }
            HStack{
                Text("\(publicWork.formatedAddress())").h4()
                Spacer()
                VStack{
                    if publicWork.toSend{
                        Image("sync_blue").renderingMode(.original)
                    }
                    if publicWork.idCollect != nil{
                        Image("check").renderingMode(.original)
                    }
                }
            }.padding(.top,10)
            
        }.padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(ColorProvider.grey3)
            .cornerRadius(8)
    }
    
    private func getDistance(location: CLLocation?) -> String{
        if(location == nil) {
            return "--"
        }
        let currLocation = CLLocation(latitude: publicWork.latitude, longitude: publicWork.longitude)
        return formatDistance(distance: location!.distance(from: currLocation))
    }
    
    private func formatDistance(distance: Double)->String{
        if(distance>1000){
            return String(format: "%.0f km", distance/1000)
        }else{
            return String(format: "%.0f m", distance)
        }
    }
}

struct PublicWorkListItem_Previews: PreviewProvider {
    static var publicWork = PublicWorkUI(PublicWork())
    
    init(){
        PublicWorkListItem_Previews.publicWork.name = "Teste"
    }
    
    static var previews: some View {
        PublicWorkListItem(publicWork: PublicWorkListItem_Previews.publicWork)
    }
}
