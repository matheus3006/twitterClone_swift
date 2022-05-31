//
//  ProfileView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/15/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel : ProfileViewModel
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    
    
    init(user:User){
        self.viewModel=ProfileViewModel(user:user)
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilter
            tweetView
            
            
            Spacer()
        }
        .navigationBarHidden(true)
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user:User(id:NSUUID().uuidString,
                              username:"batman",
                              fullname:"Bruce Wayne",
                              profileImageUrl: "",
                              email:"batman@gmail.com")
        )
    }
}



//MARK: - Header profile
extension ProfileView {
    var headerView : some View {
        VStack{
            ZStack(alignment: .bottomLeading) {
                Color(.systemBlue)
                    .ignoresSafeArea()
                
                VStack {
                    Button {
                        //Here goes de the code
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x: 16, y: -4)
                        
                    }
                    
                    //ProfileImage
                    KFImage(URL(string:viewModel.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width:72,height:72)
                        .offset(x:16,y:24)
                }
            }
            .frame(height: 96)
            
            
            
        }
    }
    
    
}

//MARK: - Action Button
extension ProfileView {
    
    var actionButtons : some View {
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                //Here goes the code
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                
            }
            
        }
        .padding(.trailing)
    }
}

//MARK: - User Info Details

extension ProfileView{
    var userInfoDetails : some View {
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Checking the message")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("City, MG")
                    
                }
                
                
                HStack{
                    Image(systemName: "link")
                    
                    Text("www.instagram.com/souza_matheus32")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
            
        }
        .padding(.horizontal)
    }
    
}

//MARK: - Tweet Filter

extension ProfileView {
    var tweetFilter: some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                    //Applies .semibold to the one that is selected
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height:3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                    }else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0, y:16))
    }
    
}

//MARK: - Tweets View
extension ProfileView {
    var tweetView : some View {
        ScrollView{
            LazyVStack{
                ForEach( viewModel.tweets(forFilter: self.selectedFilter)){ tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
                
            }
        }
    }
}
