import SwiftUI

struct TrenaRadioGroup: View {
    let options : [String]
    var onSelectedItem: ((_ selected: Int) ->Void)? = nil
    
    @Binding var selected: Int
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<options.count){i in
                RadioButton(text: self.options[i], isOn: self.binding(for: i))
            }
        }
    }
    
    private func binding(for selected: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.selected == selected },
            set: { flag in
                self.onSelectedItem?(selected)
                if flag {
                    self.selected = selected
                }
            }
        )
    }
}

struct TrenaRadioGroup_Previews: PreviewProvider {
     @State static var selected:Int = 0
    static var previews: some View {
        TrenaRadioGroup(options: ["Ordem Alfabética (A-Z)","Ordem Alfabética (Z-A)", "Distância da obra"], selected: $selected)
    }
}
