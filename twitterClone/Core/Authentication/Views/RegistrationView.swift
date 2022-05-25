//
//  RegistrationView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/22/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var authModel: AuthModel
    
    var body: some View {
        VStack{
            
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $authModel.didAuthenticateUser, label: { })
            
            //Header View
            AuthHeaderView(
                title1:"Get Started",
                title2: "Create your account"
            )
            
            VStack(spacing:40){
                CustomInputFields(
                    imageName: "envelope",
                    placeHolderText: "Email",
                    isSecureField: false,
                    text: $email
                )
                    
                
                CustomInputFields(
                    imageName: "person",
                    placeHolderText: "UserName",
                    isSecureField: false,
                    text: $userName
                )
                CustomInputFields(
                    imageName: "person",
                    placeHolderText: "Full name",
                    isSecureField: false,
                    text: $fullName
                )
                
                CustomInputFields(
                     imageName: "lock",
                     placeHolderText: "Password",
                     isSecureField: true,
                     text: $password
                )
                
            }
            .padding(32)
            
            Button {
                authModel.register(withEmail: email, password: password, fullName: fullName, userName: userName)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account ")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            

            
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
