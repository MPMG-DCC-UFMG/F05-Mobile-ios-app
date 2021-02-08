import SwiftUI
import Resolver

struct PublicWorkAddView: View {

    @ObservedObject private var publicWorkAddViewModel: PublicWorkAddViewModel = Resolver.resolve()
    
    var screenTitle: String
    @State private var pickerClosed: Bool = true
    var publicWorkId: String?
    
    init(screenTitle: String = "Adicionar obra", publicWorkId: String? = nil) {
        self.screenTitle = screenTitle
        self.publicWorkId = publicWorkId
        self.publicWorkAddViewModel.initPublicWorkUi(publicWorkId: publicWorkId)
    }

    var body: some View {
        ZStack {
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(screenTitle).h1()
                TrenaClickableField(label: "Tipo de Obra", input: publicWorkAddViewModel.currTypeWorkName, action: openPicker)
                        .padding(.top, 10)
                TrenaTextField(label: "Nome da Obra", placeHolder: "Adicionar nome", input: $publicWorkAddViewModel.name)
                    .padding(.top,5)
                HStack {
                    TrenaTextField(label: "CEP", placeHolder: "Adicionar CEP", input: $publicWorkAddViewModel.cep)
                    TrenaTextField(label: "Número", placeHolder: "#", input: $publicWorkAddViewModel.number)
                }
                TrenaTextField(label: "Rua", placeHolder: "Adicionar rua", input: $publicWorkAddViewModel.street)
                TrenaTextField(label: "Bairro", placeHolder: "Adicionar bairro", input: $publicWorkAddViewModel.neighborhood)
                TrenaTextField(label: "Cidade", placeHolder: "Adicionar cidade", input: $publicWorkAddViewModel.city)
                HStack {
                    TrenaButton(label: "Cancelar", style: .button4, action:onCancelClicked)
                    TrenaButton(label: "Adicionar Obra", action: addPublicWork, enabled: publicWorkAddViewModel.isLocationValid() && publicWorkAddViewModel.isPublicWorkValid())
                }.padding(.top, 10)
                TrenaButton(label: self.getLocationButtonText(publicWorkAddViewModel.isLocationValid()),
                            image: "mappin.and.ellipse",
                            style: self.getLocationButtonStyle(publicWorkAddViewModel.isLocationValid()),
                            action: onMapClicked).padding(.top, 5)
                Spacer()
            }
                    .foregroundColor(ColorProvider.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
            if (!pickerClosed) {
                launchTypeWorkPicker()
            }
        }
    }
    
    private func onCancelClicked(){
        self.publicWorkAddViewModel.navigateBack()
    }
    
    private func getLocationButtonText(_ addressValid: Bool)->String{
        if(addressValid) {
            return "Alterar localização (mapa)"
        }
        return  "Validar localização"
    }
    
    private func getLocationButtonStyle(_ addressValid: Bool) -> ButtonStyleEnum{
        if(addressValid) {
            return .button3
        }
        return  .button5
    }

    private func openPicker() {
        withAnimation(.easeInOut(duration: 0.5)) {
            self.pickerClosed.toggle()
        }
    }

    private func addPublicWork() {
        publicWorkAddViewModel.addPublicWork()
    }
    
    private func onMapClicked(){
        publicWorkAddViewModel.goToMap()
    }

    private func launchTypeWorkPicker() -> some View {
        let selectedOptionIndex = publicWorkAddViewModel.typeworks.firstIndex {
            $0.flag == publicWorkAddViewModel.typeWorkFlag
        } ?? 0
        return TrenaPicker(options: publicWorkAddViewModel.getTypeWorkOptions(), closed: $pickerClosed, selectedOption: selectedOptionIndex, onConfirmClicked: self.onSelectedTypeWork)
    }

    private func onSelectedTypeWork(selected: Int) {
        let options = publicWorkAddViewModel.typeworks
        let selectedTypeWork = options[selected]
        publicWorkAddViewModel.typeWorkFlag = selectedTypeWork.flag
        publicWorkAddViewModel.updateCurrTypeWorkName(typeWorkName: selectedTypeWork.name)
    }
}

struct PublicWorkAddView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkAddView()
    }
}
