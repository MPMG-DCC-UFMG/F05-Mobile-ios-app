import SwiftUI

struct PublicWorkAddScreen: View {
    
    var onCancelClicked: (() -> Void)?
    @State private var navigate = AddNavigation.form
    @State private var address = Address()
    
    var body: some View {
        ZStack {
            self.containedView().transition(AnyTransition.opacity)
                .animation(.default)
        }
    }
    
    private func containedView() -> AnyView {
        switch navigate {
        case .form:
            return AnyView(PublicWorkAddView(address: address,
                onCancelClicked: self.onCancelClicked,
                onMapClicked: { self.navigateTo(AddNavigation.map) })
            )
        default:
            return AnyView(
                PublicWorkLocationView(onCancelClicked: {
                        self.navigateTo(AddNavigation.form)
                    },
                    onConfirmClicked: { address in
                        self.address = address
                    }
                )
            )
        }
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
