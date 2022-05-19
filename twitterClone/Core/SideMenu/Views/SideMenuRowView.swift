//
//  SideMenuRowView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/17/22.
//

import SwiftUI

struct SideMenuRowView: View {
    let viewModel : SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
                
            
            
            Text(viewModel.description)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
