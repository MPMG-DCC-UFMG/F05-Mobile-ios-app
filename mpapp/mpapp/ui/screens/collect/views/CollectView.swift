import SwiftUI
import Resolver

struct CollectView: View {
    
    @ObservedObject private var collectViewModel: CollectViewModel = Resolver.resolve()
    
    var publicWorkId: String
    
    @State private var commentOn: Bool = false
    @State private var deleteClicked: Bool = false
    @State private var openWorkStatusPicker: Bool = false
    
    var body: some View {
        
        let sortedPhotos = collectViewModel.photoList.sorted(by: { $0.key < $1.key })
        
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                TrenaTopBar(title: self.collectViewModel.publicWork?.name ?? "", onBackPressed: self.onBackPressed).padding(.bottom,15)
                HStack{
                    Text(self.collectViewModel.publicWork?.formatedAddress() ?? "")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.trailing,40)
                    .h4()
                    Button(action: onEditClicked){
                        Image(systemName: "pencil")
                        .font(.system(size: 15.0))
                        Text("Editar").h3(color: ColorProvider.greenTrena)
                    }.smallButtonStyle(style:.smallButton1)
                }
                Spacer()
                List{
                    ForEach(sortedPhotos,id: \.key){ (key, value) in
                        Button(action: {
                            self.onPhotoClicked(value)
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
            if(commentOn){
                CommentBottom(closed: $commentOn, comment: collectViewModel.currentCollect.comments ?? "",onConfirmClicked:self.collectConfirmClicked).transition(AnyTransition.opacity).animation(.default)
            }
            if(deleteClicked){
                TrenaDialog( title: "Deletar Coleta",message: "A coleta não poderá ser restaurada, deseja continuar?",onPositiveClicked: handleDeleteCollect,onCloseClicked: {deleteClicked.toggle()})
            }
            if(openWorkStatusPicker){
                createTrenaPicker()
            }
        }.onAppear{
            self.collectViewModel.setPublicWork(publicWorkId: publicWorkId)
        }
    }
    
    private func createTrenaPicker() -> TrenaPicker {
        let workStatus = collectViewModel.getWorkStatusesForPublicWork()
        var options = workStatus.map{$0.name}
        options.insert("--------", at: 0)
        return TrenaPicker(options: options, closed: self.$openWorkStatusPicker, selectedOption: 0,negativeText: "Descartar", onConfirmClicked: {index in
            
            var selectedWorkStatus: WorkStatus? = nil
            if(index > 0){
                selectedWorkStatus = workStatus[index-1]
            }
            updateCollect(selectedWorkStatus)
        }, onNegativeClicked: {
            collectViewModel.navigateBack()
        })
    }
    
    private func updateCollect(_ workStatus: WorkStatus?){
        collectViewModel.updateCollect(workStatus: workStatus)
        collectViewModel.navigateBack()
    }
    
    private func onCommentClicked(){
        commentOn.toggle()
    }
    
    private func onBackPressed(){
        openWorkStatusPicker.toggle()
    }
    
    private func onDeleteClicked(){
        deleteClicked.toggle()
    }
    
    private func handleDeleteCollect(){
        collectViewModel.deleteCollect()
        collectViewModel.navigateBack()
    }
    
    private func collectConfirmClicked(_ comment: String){
        collectViewModel.updateComment(comment)
    }
    
    private func onAddClicked(){
        collectViewModel.navigateToPhoto()
    }
    
    private func onEditClicked(){
        collectViewModel.editPublicWork()
    }
    
    private func onPhotoClicked(_ photo: PhotoUI){
        collectViewModel.navigateToPhoto(photo.getId())
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView(publicWorkId: "")
    }
}
