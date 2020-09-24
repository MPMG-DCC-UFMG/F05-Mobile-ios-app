import SwiftUI
import Resolver

struct CollectView: View {
    
    @ObservedObject private var collectViewModel: CollectViewModel = Resolver.resolve()
    @ObservedObject private var photoViewModel: PhotoViewModel = Resolver.resolve()
    
    var publicWork: PublicWorkUI
    var onBackPressed: (() -> Void)?
    var onEditClicked: (() -> Void)?
    var onDeleteClicked: (() -> Void)?
    var onAddClicked: (() -> Void)?
    var onCommentClicked: (() -> Void)?
    var onPhotoClicked: ((_ photoUI: PhotoUI) -> Void)?
    
    var body: some View {
        
        let sortedPhotos = collectViewModel.photoList.sorted(by: { $0.key < $1.key })
        
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                TrenaTopBar(title: self.publicWork.name, onBackPressed: self.onBackPressed).padding(.bottom,15)
                HStack{
                    Text(self.publicWork.formatedAddress())
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.trailing,40)
                    .h4()
                    Button(action: {self.onEditClicked?()}){
                        Image(systemName: "pencil")
                        .font(.system(size: 15.0))
                        Text("Editar").h3(color: ColorProvider.greenTrena)
                    }.smallButtonStyle(style:.smallButton1)
                }
                Spacer()
                List{
                    ForEach(sortedPhotos,id: \.key){ (key, value) in
                        Button(action: {
                            self.onPhotoClicked?(value)
                        }){
                            PhotoItem(photoUI: value)
                        }
                    }
                    .listRowBackground(ColorProvider.darkBackground)
                }
                .onAppear { UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().bounces = false
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
                .onDisappear {
                    UITableView.appearance().separatorStyle = .singleLine
                }
                .padding(.horizontal, -20)
                .listStyle(PlainListStyle())
            }.padding(.horizontal,10)
            FloatingMenu(onDeleteClicked: self.onDeleteClicked, onAddClicked: self.onAddClicked, onCommentClicked: self.onCommentClicked)
        }
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView(publicWork: PublicWorkUI(PublicWork()))
    }
}
