//
//  TweetRowView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/15/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            // profile image + user info  + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
            
                //User info & tweet caption
                VStack (alignment: .leading, spacing: 4){
                    //User info
                    HStack{
                        Text("Seu Jorge")
                            .font(.subheadline).bold()
                        
                        Text("@minha_morena")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }
                    
                    //Tweet caption
                    Text("I believe this could work")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }
                        
            }
            
            // action button
            HStack{
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
            // action button end
            
        }
        
        // profile image + user info  + tweet
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
