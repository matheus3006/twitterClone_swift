

import SwiftUI
import Firebase
import FirebaseFirestore

class AuthModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession : FirebaseAuth.User?
    
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        self.fetchUser()
    }
    
    
    func logIn(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let error = err {
                print("DEBUG: Failed to sign in user account")
                return
            }
             
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
            
        }
        
        
    }
    
    func register(withEmail email: String, password: String, fullName:String, userName: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let error = err {
                print("DEBUG: Failed to sign up user account")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            
            let data = [
                "email": email,
                "username": userName.lowercased(),
                "fullname": fullName,
                "uid": user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    print("DEBUG: Did upload user data...")
                }
            
        }
        
    }
    
    
    func singOut(){
        userSession = nil
        currentUser = nil
        tempUserSession = nil
        try? Auth.auth().signOut()
        
    }
    
    
    func uploadProfileImage(image:UIImage){
        guard let uid=tempUserSession?.uid else{return}
        ImageUploader.uploadImage(image:image){ profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl":profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        
        }
    
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else{return}
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
