//
//  TweetRowViewModel.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/30/22.
//

import Foundation
class TweetRowViewModel : ObservableObject{
    @Published var tweet: Tweet
     
    private let service = TweetService()
  
    init(tweet:Tweet){
        
        self.tweet=tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet) { _ in
            self.tweet.didLike = true
        }
   }
    
    func unlikeTweet(){
        service.unlikeTweet(tweet: tweet){
            self.tweet.didLike=false        
        }
    }
    
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet: tweet){ didLike in
            if didLike{
                self.tweet.didLike=true
            }
        }
    }
}
