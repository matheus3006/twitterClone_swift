//
//  User.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/27/22.
//

import FirebaseFirestoreSwift

struct User : Identifiable , Decodable{
    @DocumentID var id:String?
    let username:String
    let fullname:String
    let profileImageUrl:String
    let email:String
}
