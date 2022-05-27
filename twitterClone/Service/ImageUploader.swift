//
//  ImageUploader.swift
//  twitterClone
//
//  Created by Matheus Souza on 5/26/22.
//

import FirebaseStorage
import UIKit

struct ImageUploader{
    static func uploadImage(image : UIImage,completion: @escaping(String)->Void){
        guard let imageData = image.jpegData(compressionQuality:0.5) else {return}
        let filename = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath:"/profile_image/\(filename)")
        ref.putData(imageData, metadata: nil){ _ , error in
            if let error=error{
                print("DEBUG:Failed to upload image with error:\(error.localizedDescription)")
                
                return
                
            }
            
            
            
            
        }
        
    }
}
