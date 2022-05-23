//
//  CustomInputFields.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/22/22.
//

import SwiftUI

struct CustomInputFields: View {
    let imageName: String
    let placeHolderText: String
    let isSecureField: Bool
    
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField != false {
                    SecureField(placeHolderText, text: $text)
                }else{
                    TextField(placeHolderText, text: $text)
                }
                
                
            }
            
            Divider()
                .background(Color(.darkGray))
            
            
            
        }
    }
}

struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFields(imageName: "envelope", placeHolderText: "Email", isSecureField: false, text: .constant(""))
    }
}
