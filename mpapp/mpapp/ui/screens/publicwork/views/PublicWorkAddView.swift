import SwiftUI
import Resolver

struct PublicWorkAddView: View {

    @ObservedObject private var typeWorkViewModel: TypeWorkViewModel = Resolver.resolve()
    
    var screenTitle: String
    var onCancelClicked: (() -> Void)?
    var onMapClicked: (() -> Void)?
    var onAddClicked: (() -> Void)?
    @State private var pickerClosed: Bool = true
    @ObservedObject var publicWorkUI: PublicWorkUI

    init(screenTitle: String = "Adicionar obra", publicWork: PublicWorkUI, onCancelClicked: (() -> Void)? = nil,onMapClicked: (() -> Void)? = nil,onAddClicked: (() -> Void)? = nil) {
        self.screenTitle = screenTitle
        self.onCancelClicked = onCancelClicked
        self.onMapClicked = onMapClicked
        self.onAddClicked = onAddClicked
        self.publicWorkUI = publicWork
    }

    var body: some View {
        ZStack {
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(screenTitle).h1()
                TrenaClickableField(label: "Tipo de Obra", input: getCurretTypeWorkName(), action: openPicker)
                        .padding(.top, 10)
                TrenaTextField(label: "Nome da Obra", placeHolder: "Adicionar nome", input: $publicWorkUI.name)
                    .padding(.top,5)
                HStack {
                    TrenaTextField(label: "CEP", placeHolder: "Adicionar CEP", input: $publicWorkUI.cep)
                    TrenaTextField(label: "Número", placeHolder: "#", input: $publicWorkUI.number)
                }
                TrenaTextField(label: "Rua", placeHolder: "Adicionar rua", input: $publicWorkUI.street)
                TrenaTextField(label: "Bairro", placeHolder: "Adicionar bairro", input: $publicWorkUI.neighborhood)
                TrenaTextField(label: "Cidade", placeHolder: "Adicionar cidade", input: $publicWorkUI.city)
                HStack {
                    TrenaButton(label: "Cancelar", style: .button4, action: {
                        self.onCancelClicked?()
                    })
                    TrenaButton(label: "Adicionar Obra", action: addPublicWork, enabled: publicWorkUI.isLocationValid() && publicWorkUI.isPublicWorkValid())
                }.padding(.top, 10)
                TrenaButton(label: self.getLocationButtonText(publicWorkUI.isLocationValid()),
                            image: "mappin.and.ellipse",
                            style: self.getLocationButtonStyle(publicWorkUI.isLocationValid()),
                            action: {
                    self.onMapClicked?()
                }).padding(.top, 5)
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
        self.onAddClicked?()
    }

    private func launchTypeWorkPicker() -> some View {
        let selectedOptionIndex = typeWorkViewModel.typeworks.firstIndex {
            $0.flag == publicWorkUI.typeWorkFlag
        } ?? 0
        return TrenaPicker(options: getTypeWorkOptions(), closed: $pickerClosed, selectedOption: selectedOptionIndex, onConfirmClicked: self.onSelectedTypeWork)
    }

    private func onSelectedTypeWork(selected: Int) {
        let options = typeWorkViewModel.typeworks
        publicWorkUI.typeWorkFlag = options[selected].flag
    }

    private func getTypeWorkOptions() -> [String] {
        return typeWorkViewModel.typeworks.map({ $0.name })
    }

    private func getCurretTypeWorkName() -> String {
        let currentTypeWork = typeWorkViewModel.getTypeWorkByFlag(publicWorkUI.typeWorkFlag) ?? typeWorkViewModel.typeworks.first!
        if (currentTypeWork.flag != publicWorkUI.typeWorkFlag) {
            publicWorkUI.typeWorkFlag = currentTypeWork.flag
        }
        return currentTypeWork.name
    }
}

struct PublicWorkAddView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkAddView(publicWork: PublicWorkUI(PublicWork()))
    }
}
