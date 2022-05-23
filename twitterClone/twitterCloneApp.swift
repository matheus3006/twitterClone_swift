//
//  twitterCloneApp.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/15/22.
//

import SwiftUI
import Firebase

@main
struct twitterCloneApp: App {
    init(){
        FirebaseApp.configure()
        
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                ContentView()

                
            }
        }
    }
}
 
