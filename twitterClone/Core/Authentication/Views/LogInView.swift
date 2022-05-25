//
//  LogInView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/22/22.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authModel: AuthModel
    
    var body: some View {
        //Parant container
        VStack{
            
            //Header view
            AuthHeaderView(
                title1:"Hello",
                title2: "Welcome Back"
            )
            
            
            VStack(spacing: 40){
                CustomInputFields(
                    imageName: "envelope",
                    placeHolderText: "Email",
                    isSecureField: false,
                    text: $email
                )
                
                CustomInputFields(
                     imageName : "lock",
                     placeHolderText : "Password",
                     isSecureField : true,
                     text: $password
                    
                     
                )
            
                
            }
            .padding(.horizontal, 32)
            .padding(.top,44)
            
            
            HStack{
                Spacer()
                
                NavigationLink {
                    Text("Reset password view...")
                } label: {
                    Text("Forgot password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.trailing, 24)
                    
                }
            }
                        
            Button {
                authModel.logIn(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            //gives a suddle to button making it popout a bit more
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            
            
            
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
                
            } label: {
                HStack{
                    Text("Don't have an account ")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
                .foregroundColor(Color(.systemBlue))
                
            }

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
