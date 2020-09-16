import SwiftUI
import Resolver

struct PublicWorkAddView: View {

    @ObservedObject private var typeWorkViewModel: TypeWorkViewModel = Resolver.resolve()
    @ObservedObject private var publicWorkViewModel: PublicWorkViewModel = Resolver.resolve()

    var screenTitle: String
    var onCancelClicked: (() -> Void)?
    var onMapClicked: (() -> Void)?

    private var address: Address
    private var publicWork: PublicWork
    @State private var pickerClosed: Bool = true
    @State private var name: String = ""
    @State private var cep: String = ""
    @State private var number: String = ""
    @State private var street: String = ""
    @State private var neighborhood: String = ""
    @State private var city: String = ""

    init(screenTitle: String = "Adicionar obra", publicWork: PublicWork = PublicWork(),address: Address = Address(), onCancelClicked: (() -> Void)? = nil,
         onMapClicked: (() -> Void)? = nil) {
        self.address = address 
        self.publicWork = publicWork
        _name = State(initialValue: self.publicWork.name)
        _cep = State(initialValue: self.address.cep)
        _number = State(initialValue: self.address.number)
        _street = State(initialValue: self.address.street)
        _neighborhood = State(initialValue: self.address.neighborhood)
        _city = State(initialValue: self.address.city)
        self.screenTitle = screenTitle
        self.onCancelClicked = onCancelClicked
        self.onMapClicked = onMapClicked
    }

    var body: some View {
        ZStack {
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(screenTitle).h1()
                TrenaClickableField(label: "Tipo de Obra", input: getCurretTypeWorkName(), action: openPicker)
                        .padding(.top, 15)
                TrenaTextField(label: "Nome da Obra", placeHolder: "Adicionar nome", input: $name)
                HStack {
                    TrenaTextField(label: "CEP", placeHolder: "Adicionar CEP", input: $cep)
                    TrenaTextField(label: "Número", placeHolder: "#", input: $number)
                }
                TrenaTextField(label: "Rua", placeHolder: "Adicionar rua", input: $street)
                TrenaTextField(label: "Bairro", placeHolder: "Adicionar bairro", input: $neighborhood)
                TrenaTextField(label: "Cidade", placeHolder: "Adicionar cidade", input: $city)
                HStack {
                    TrenaButton(label: "Cancelar", style: .button4, action: {
                        self.onCancelClicked?()
                    })
                    TrenaButton(label: "Adicionar Obra", action: addPublicWork, enabled: address.isLocationValid() && publicWork.isPublicWorkValid())
                }.padding(.top, 10)
                TrenaButton(label: self.getLocationButtonText(address.isLocationValid()),
                            image: "mappin.and.ellipse",
                            style: self.getLocationButtonStyle(address.isLocationValid()),
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
        address.cep = self.cep
        address.number = self.number
        address.neighborhood = self.neighborhood
        address.number = self.number
        address.city = self.city
        address.street = self.street
        address.idPublicWork = String(self.publicWork.id)
        publicWork.address = address
        publicWork.idAddress = String(address.id)
        publicWork.name = self.name
        publicWork.toSend = true
        publicWorkViewModel.addToDb(publicWork: publicWork)
        self.onCancelClicked?()
    }

    private func launchTypeWorkPicker() -> some View {
        let selectedOptionIndex = typeWorkViewModel.typeworks.firstIndex {
            $0.flag == publicWork.typeWorkFlag
        } ?? 0
        return TrenaPicker(options: getTypeWorkOptions(), closed: $pickerClosed, selectedOption: selectedOptionIndex, onConfirmClicked: self.onSelectedTypeWork)
    }

    private func onSelectedTypeWork(selected: Int) {
        let options = typeWorkViewModel.typeworks
        publicWork.typeWorkFlag = options[selected].flag
    }

    private func getTypeWorkOptions() -> [String] {
        return typeWorkViewModel.typeworks.map({ $0.name })
    }

    private func getCurretTypeWorkName() -> String {
        let currentTypeWork = typeWorkViewModel.getTypeWorkByFlag(publicWork.typeWorkFlag) ?? typeWorkViewModel.typeworks.first!
        if (currentTypeWork.flag != publicWork.typeWorkFlag) {
            publicWork.typeWorkFlag = currentTypeWork.flag
        }
        return currentTypeWork.name
    }
}

struct PublicWorkAddView_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkAddView()
    }
}
