import SwiftUI

struct PublicWorkFilterView: View {
    var body: some View {
        ZStack{
             ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("Filtrar")
                .h1()
                .padding(.top,20)
                TrenaClickableField(label: "Tipo de Obra", input: "teste", action: {})
                .padding(.top, 15)
                
            }.padding()
        }
        
    }
}

struct PublicWorkFilterView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkFilterView()
    }
}
