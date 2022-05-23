//
//  AuthModel.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/23/22.
//

import SwiftUI
import Firebase

class AuthModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    
    
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User Session is: \(self.userSession)")
    }
    
    
    func logIn(withEmail email: String, password: String){
        print("DEBUG: Log in with email: \(email)")
    }
    
    func register(withEmail email: String, password: String, fullName:String, userName: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let error = err {
                print("DEBUG: Failed to sign up user account")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            
            
            let data = [
                "email": email,
                "username": userName.lowercased(),
                "fullname": fullName,
                "uid": user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data...")
                }
            
        }
        
    }
    
}
