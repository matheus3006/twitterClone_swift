//
//  Up;padTweetViewModel.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/28/22.
//

import Foundation

import Foundation
class UploadTweetViewModel : ObservableObject{
    @Published var didUploadTweet=false
    let service = TweetService()
    
    func uploadTweet(withCaption caption:String) {
        service.uploadTweet(caption: caption) { success in
            if success{
                // dismiss screen somehow
                self.didUploadTweet=true

            }else{
                // show error message to user.

            }
                
            
            
            
        }

    }
}
