import SwiftUI
import Resolver

struct CollectScreen: View {
    
    @ObservedObject private var collectViewModel: CollectViewModel = Resolver.resolve()
    @ObservedObject private var workStatusViewModel: WorkStatusViewModel = Resolver.resolve()
    @ObservedObject private var photoViewModel: PhotoViewModel = Resolver.resolve()
    
    var onBackPressed: (() -> Void)?
    @ObservedObject var publicWork: PublicWorkUI
    
    @State private var commentOn: Bool = false
    @State private var deleteClicked: Bool = false
    @State private var navigate = CollectNavigation.collectMain
    @State private var openWorkStatusPicker: Bool = false
    
    var body: some View {
        ZStack{
            self.containedView().transition(AnyTransition.opacity)
                .animation(.default)
            if(commentOn){
                CommentBottom(closed: $commentOn, comment: collectViewModel.currentCollect.comments ?? "",onConfirmClicked:self.collectConfirmClicked).transition(AnyTransition.opacity).animation(.default)
            }
            if(deleteClicked){
                TrenaDialog( title: "Deletar Coleta",message: "A coleta não poderá ser restaurada, deseja continuar?",onPositiveClicked: handleDeleteCollect,onCloseClicked: {deleteClicked.toggle()})
            }
            if(openWorkStatusPicker){
                createTrenaPicker()
            }
        }.onAppear {
            collectViewModel.updateCurrentCollect(publicWork)
        }
    }
    
    private func createTrenaPicker() -> TrenaPicker {
        let workStatus = workStatusViewModel.getWorkStatusesForPublicWork(publicWork)
        var options = workStatus.map{$0.name}
        options.insert("--------", at: 0)
        return TrenaPicker(options: options, closed: self.$openWorkStatusPicker, selectedOption: 0,negativeText: "Descartar", onConfirmClicked: {index in
            
            var selectedWorkStatus: WorkStatus? = nil
            if(index > 0){
                selectedWorkStatus = workStatus[index-1]
            }
            updateCollect(selectedWorkStatus)
        }, onNegativeClicked: self.onBackPressed)
    }
    
    private func updateCollect(_ workStatus: WorkStatus?){
        collectViewModel.updateCollect(workStatus: workStatus)
        self.onBackPressed?()
    }
    
    private func containedView() -> AnyView {
        switch navigate {
        case .editPublicWork:
            return AnyView(
                PublicWorkAddView()
            )
        case .photo:
            return AnyView(
                PhotoView(onBackPressed: {self.navigateTo(.collectMain)},onDeletePhotoClicked: onDeletePhotoClicked)
            )
        default:
            return AnyView(
                CollectView(publicWorkId: self.publicWork.getId())
            )
            
        }
    }
    
    private func onDeletePhotoClicked(_ photo: PhotoUI){
        collectViewModel.removePhotoFromList(photo)
    }
    
    private func onPhotoClicked(_ photoUI: PhotoUI){
        photoViewModel.startPhotoFlow(photoUI,idCollect: collectViewModel.currentCollect.getId())
        self.navigateTo(.photo)
    }
    
    private func handleDeleteCollect(){
        self.onBackPressed?()
    }
    
    private func handleOnAddClicked(){
        photoViewModel.startPhotoFlow(idCollect: collectViewModel.currentCollect.getId())
        self.navigateTo(.photo)
    }
    
    private func handleOnBackPressed(){
        openWorkStatusPicker.toggle()
    }
    
    private func onDeleteClicked(){
        self.deleteClicked.toggle()
    }
    
    private func onCommentClicked(){
        self.commentOn.toggle()
    }
    
    private func navigateTo(_ to: CollectNavigation) {
        self.navigate = to
    }
    
    private func collectConfirmClicked(_ comment: String){
        collectViewModel.updateComment(comment)
    }
}

struct CollectScreen_Previews: PreviewProvider {
    static var previews: some View {
        CollectScreen( publicWork: PublicWorkUI(PublicWork()))
    }
}
