//
//  ProfilePhotoSelectorView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/23/22.
//

import SwiftUI

struct ProfilePhotoSelectorView : View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        VStack{
            AuthHeaderView(title1:"Setup Account",
                           title2:"Add a profile Photo")
            
                        
            imagePicker
                .sheet(isPresented:$showImagePicker, onDismiss: loadImage){
                    ImagePicker(selectedImage : $selectedImage)
                }
                .padding(.top,44)
            
            if let selectedImage = selectedImage {
                Button{
                    viewModel.uploadProfileImage(image: selectedImage)
                }label:{
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:340,height:50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color:.gray.opacity(0.5),radius:10,x:0,y:0)
            }
            
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage=selectedImage else{return}
        profileImage = Image(uiImage:selectedImage)
    }
    
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

//MARK: - ImagePicker & Continue Button
extension ProfilePhotoSelectorView {
    var imagePicker: some View {
        
        Button{
            showImagePicker.toggle()
        }label:{
            if let profileImage = profileImage {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            }else{
                VStack{
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 175)
                    
                    Text("PHOTO")
                        .fontWeight(.semibold)
                }
                
            }
        }
        
    }
    
    
}

private struct ProfileImageModifier : ViewModifier{
    func body(content:Content)->some View{
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width:180,height:180)
            .clipShape(Circle())
    }
}
