//
//  ProfileViewModel.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/29/22.
//

import Foundation


class ProfileViewModel:ObservableObject{
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user : User
    
    init(user:User){
        
        self.user = user
        self.fetchUserTweets()
    }
     
    
    func fetchUserTweets(){
        guard let uid = user.id else{return}
        service.fetchTweetsByUser(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                self.tweets[i].user = self.user
                
            }
        }
    }
}
