//
//  ExploreView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/17/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.searchableUsers){ user in
                        NavigationLink {
                              ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                        
                        
                    }
                }
            }
            
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
