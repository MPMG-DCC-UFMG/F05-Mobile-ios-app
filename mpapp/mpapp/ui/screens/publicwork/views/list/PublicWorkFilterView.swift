import SwiftUI
import Resolver

struct PublicWorkFilterView: View {
    
    @ObservedObject var publicWorkViewModel: PublicWorkViewModel

    @State private var pickerClosed: Bool = true

    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("Filtrar")
                    .h1()
                    .padding(.top,20)
                TrenaClickableField(label: "Tipo de Obra", input: getAppliedTypeWorksString(publicWorkViewModel.filterTypeWorkFlags),
                    hint:"Clique para selecionar tipo de obra",action: self.openPicker)
                    .padding(.top, 15)
                Text("Ordenar por".uppercased())
                    .foregroundColor(ColorProvider.white)
                    .h5()
                    .padding(.leading,8)
                    .padding(.top,20)
                TrenaRadioGroup(options: ["Ordem Alfabética (A-Z)","Ordem Alfabética (Z-A)", "Distância da obra"],selected: $publicWorkViewModel.selected)
                Text("Estados dos dados das obras".uppercased())
                    .foregroundColor(ColorProvider.white)
                    .h5()
                    .padding(.leading,8)
                    .padding(.top,20)
                Checkbox(text: "Coleta para enviar", image: "check", isOn: $publicWorkViewModel.collectToSend)
                Checkbox(text: "Informações para atualizar", image: "sync_blue", isOn: $publicWorkViewModel.dataToSend)
                Spacer()
            }.padding()
            if (!pickerClosed) {
                launchTypeWorkPicker()
            }
        }
    }
    
    private func openPicker() {
        withAnimation(.easeInOut(duration: 0.5)) {
            self.pickerClosed.toggle()
        }
    }
    
    private func launchTypeWorkPicker() -> some View {
        return TrenaMultiPicker(options: getTypeWorkOptions(), closed: $pickerClosed, selectedOptions: getFilteredOptios(), onConfirmClicked: self.onSelectedFilter)
    }
    
    private func getTypeWorkOptions() -> [String] {
        return publicWorkViewModel.typeworks.map({ $0.name })
    }
    
    private func getAppliedTypeWorksString(_ filterTypeWorkFlags: [Int]) -> String{
        let appliedFilters = Set<Int>(filterTypeWorkFlags)
        var selectedFlags = Array<String>()
        publicWorkViewModel.typeworks.enumerated().forEach({ index,item in
            if(appliedFilters.contains(item.flag)){
                selectedFlags.append(item.name)
            }
        })
        return selectedFlags.joined(separator: ",")
    }
    
    private func getFilteredOptios() -> [Bool]{
        let appliedFilters = Set<Int>(publicWorkViewModel.filterTypeWorkFlags)
        return publicWorkViewModel.typeworks.map({ appliedFilters.contains($0.flag)})
    }
    
    private func onSelectedFilter(_ selected: Set<Int>){
        var selectedFlags = Array<Int>()
        publicWorkViewModel.typeworks.enumerated().forEach({ index,item in
            if(selected.contains(index)){
                selectedFlags.append(item.flag)
            }
        })
        publicWorkViewModel.updateFilteredWorkFlags(filterTypeWorkFlags: selectedFlags)
    }
}

struct PublicWorkFilterView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkFilterView(publicWorkViewModel: PublicWorkViewModel(publicWorkRepository: PublicWorkRepository(localPublicWorkDataSource: LocalPublicWorkDataSource(), remotePublicWorkDataSource: RemotePublicWorkDataSource()), typeWorkRepository: TypeWorkRepository(localTypeWorkDataSource: LocalTypeWorkDataSource())))
    }
}