//
//  Tweet.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/28/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet : Identifiable,Decodable {
    @DocumentID var id:String?
    
    let caption:String
    let timestamp:Timestamp
    let uid:String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
