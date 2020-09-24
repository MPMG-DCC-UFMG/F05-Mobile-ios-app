import SwiftUI
import Resolver

struct PhotoView: View {
    
    @ObservedObject private var typePhotoViewModel: TypePhotoViewModel = Resolver.resolve()
    @ObservedObject private var photoViewModel: PhotoViewModel = Resolver.resolve()
    @ObservedObject private var collectViewModel: CollectViewModel = Resolver.resolve()
    @ObservedObject private var locationManager: LocationManager = Resolver.resolve()
    
    var onBackPressed: (() -> Void)?
    var onDeletePhotoClicked: ((_ photoUI: PhotoUI) -> Void)?
    
    @State private var openPicker: Bool = false
    @State private var showCaptureImageView: Bool = false
    @State private var comment = ""
    @State private var deleteClicked: Bool = false
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                TrenaTopBar(title: photoViewModel.currPhoto.typePhotoName ?? "Tipo de foto", onBackPressed: self.onBackPressed).padding(.bottom,30)
                
                Button(action: self.handleImageClick){
                    VStack{
                        if(photoViewModel.currPhoto.uiImage == nil){
                            Image("thumbnail")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25.0, height: 25.0)
                        }else{
                            Image(uiImage: photoViewModel.currPhoto.uiImage!)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        
                    }.frame(width: 300.0, height: 250.0)
                    .background(ColorProvider.grey3)
                    .cornerRadius(20, corners: [.topLeft, .topRight,.bottomLeft,.bottomRight])
                }
                TextEditor(text: $comment)
                    .h3()
                    .lineLimit(6)
                    .background(ColorProvider.grey1)
                    .frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .leading)
                    .padding(.horizontal,15)
                    .cornerRadius(20, corners: [.topLeft, .topRight,.bottomLeft,.bottomRight])
                    .onAppear(perform: {
                        UITextView.appearance().backgroundColor = .clear
                        self.comment = self.photoViewModel.currPhoto.comments ?? ""
                    })
                
                VStack{
                    TrenaButton(label: "Confirmar Foto",image: "camera", style: .button2, action: addPhoto, enabled: photoViewModel.isPhotoValid())
                    getNegativeButton(photoViewModel.currPhoto.uiImage)
                }.padding(.horizontal,25)
                Spacer()
            }.padding(.horizontal,10)
            
            if(openPicker){
                createTrenaPicker()
            }
            if (showCaptureImageView) {
                CaptureImageView(isShown: $showCaptureImageView, uiImage: $photoViewModel.currPhoto.uiImage)
            }
            
            if(deleteClicked){
                TrenaDialog( title: "Deletar foto",message: "A foto não poderá ser restaurada",onPositiveClicked: handleDeleteClicked,onCloseClicked: {deleteClicked.toggle()})
            }
        }.onAppear{
            self.openPicker = photoViewModel.currPhoto.typePhotoName == nil
            photoViewModel.currPhoto.updateLocation(locationManager.location)
        }
    }
    
    private func handleImageClick() {
        self.showCaptureImageView.toggle()
    }
    
    private func getNegativeButton(_ uiImage: UIImage?) -> TrenaButton{
        if(uiImage == nil){
            return TrenaButton(label: "Cancelar", style: .button4, action: {
                self.onBackPressed?()
            })
        }else{
            return TrenaButton(label: "Deletar Foto",image: "trash", style: .button3, action:{deleteClicked.toggle()})
        }
    }
    
    private func addPhoto(){
        let photo = photoViewModel.saveCurrPhoto()
        if(photo != nil){
            collectViewModel.addPhotoToList(photo: photo!)
            self.onBackPressed?()
        }
    }
    
    private func handleDeleteClicked(){
        onDeletePhotoClicked?(photoViewModel.currPhoto)
        onBackPressed?()
    }
    
    private func createTrenaPicker() -> TrenaPicker {
        let typePhotos = typePhotoViewModel.typePhotos
        return TrenaPicker(options: typePhotos.map{$0.name}, closed: self.$openPicker, selectedOption: 0, onConfirmClicked: {index in
            updatePhoto(typePhotos[index])
        }, onNegativeClicked: self.onBackPressed)
    }
    
    private func updatePhoto(_ typePhoto: TypePhoto){
        photoViewModel.currPhoto.updateTypePhoto(typePhoto)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
