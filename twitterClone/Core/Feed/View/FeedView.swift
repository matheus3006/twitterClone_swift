//
//  FeedView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/15/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
     
    var body: some View {
        ZStack (alignment: .bottomTrailing){

            //ScrollFeedView
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 20, id: \.self){ _ in
                        TweetRowView()
                            .padding()
                    }
                }
            }
            
            //FeedButton
            Button {
                showNewTweetView.toggle()
                
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
            

        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
