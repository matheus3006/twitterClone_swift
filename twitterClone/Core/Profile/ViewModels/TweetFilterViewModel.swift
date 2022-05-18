//
//  TweetFilterViewModel.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/16/22.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
            
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
            
            
        }
        
    }
    
    
}
