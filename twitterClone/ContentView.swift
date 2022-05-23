//
//  ContentView.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/15/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var authModel : AuthModel
    
    var body: some View {
        Group {
            //No logged user
            if authModel.userSession == nil {
                LogInView()
            }
            //Logged User
            else{
                mainInterfaceView
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}



//MARK: - Main interface View
extension ContentView {
    var mainInterfaceView: some View{
        ZStack(alignment: .topLeading){
            
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu{
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width:300)
                .offset(x: showMenu ? 0 : -300, y:0)
                .background(showMenu ? Color.white : Color.clear)
           .navigationTitle("Home")
           .navigationBarTitleDisplayMode(.inline)
           .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                   Button {
                            //Here goes the code
                      withAnimation(.easeInOut){
                          showMenu.toggle()
                       }
                   } label: {
                       Circle()
                           .frame(width: 32, height: 32)
                            
                }

                }
           }
        }
        .onAppear{
            showMenu = false
        }
        
    }
}
