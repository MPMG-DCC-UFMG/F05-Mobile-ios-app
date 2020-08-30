import SwiftUI

struct SearchField: View {
    
    var placeHolder: String
    
    @State var input = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18.0))
                .foregroundColor(ColorProvider.white)
            ZStack(alignment: .leading){
                if input.isEmpty{
                    Text(placeHolder)
                }
                TextField("", text:$input).foregroundColor(ColorProvider.white)
            }
            .h2()
            .padding(.trailing,8)
        } .frame(height: 55.0)
            .padding(.leading, 15)
            .background(ColorProvider.grey3)
            .cornerRadius(8)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(placeHolder: "Pesquise por alguma obra especifíca")
    }
}
