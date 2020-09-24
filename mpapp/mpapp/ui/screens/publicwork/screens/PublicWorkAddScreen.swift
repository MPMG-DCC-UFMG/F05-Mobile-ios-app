import SwiftUI
import Resolver

struct PublicWorkAddScreen: View {
    
    @ObservedObject private var publicWorkViewModel: PublicWorkViewModel = Resolver.resolve()
    
    @ObservedObject var publicWorkUI = PublicWorkUI(PublicWork())
    var onCancelClicked: (() -> Void)?
    var onAddClicked: (()-> Void)?
    @State private var navigate = AddNavigation.form
    
    var body: some View {
        ZStack {
            self.containedView().transition(AnyTransition.opacity)
                .animation(.default)
        }
    }
    
    private func containedView() -> AnyView {
        switch navigate {
        case .form:
            return AnyView(
                PublicWorkAddView(publicWork: publicWorkUI,
                                  onCancelClicked: self.onCancelClicked,
                                  onMapClicked: { self.navigateTo(AddNavigation.map) },
                                  onAddClicked: self.addPublicWork)
            )
        default:
            return AnyView(
                PublicWorkLocationView(onCancelClicked: {
                    self.navigateTo(AddNavigation.form)
                },
                onConfirmClicked: { address in
                        publicWorkUI.updateAddress(address)
                    }
                )
            )
        }
    }
    
    private func addPublicWork() {
        publicWorkViewModel.addToDb(publicWorkUI)
        self.onAddClicked?()
        self.onCancelClicked?()
    }
    
    private func navigateTo(_ to: AddNavigation) {
        self.navigate = to
    }
}

struct PublicWorkAddScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublicWorkAddScreen()
    }
}
