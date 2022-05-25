//
//  ProfilePhotoSelectorView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/23/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup Account", title2: "Add a profile Photo")
            
            Button {
                print("Pick image Here")
            } label: {
                VStack{
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 175)
                        .padding(.top, 44)
                    Text("PHOTO")
                        .fontWeight(.semibold)
                
                }
            }

            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}



   
