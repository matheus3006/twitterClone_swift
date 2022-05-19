//
//  SideMenuView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/17/22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading,spacing: 4){
                    Text("Matheus souza")
                        .font(.headline)
                    
                    Text("@Dev_Ios")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
               UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }

                }else if viewModel == .logout{
                    Button {
                        print("Handle logout here")
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }
                }else{
                    SideMenuRowView(viewModel: viewModel)
                }
                
                
                                
            }
            
            
            Spacer()
            
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


