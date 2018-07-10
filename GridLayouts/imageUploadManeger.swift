//
//  imageUploadManeger.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit
import Firebase

class ImageUploadManeger: NSObject {
    
    struct Constants {
        
        struct Car {
            static let imageFolder:String = "carImages"
        }
    }

    func uploadImage(_ image:UIImage,progressBlock: @escaping (_ percentage:Double)-> Void, completionBlock: @escaping (_ url: URL?, _ errorMessage: String?) -> Void){
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let imageName = "\(Date().timeIntervalSince1970).jpg"
        let imagesreference = storageReference.child(Constants.Car.imageFolder).child(imageName)
        
        if let imageData = UIImageJPEGRepresentation(image, 0.1){
        
            let uploadTask = imagesreference.putData(imageData, metadata: nil) { (metadata, error) in
                imagesreference.downloadURL(completion: { (url, error) in
                    guard error == nil else{
                        return
                    }
                    if let imageUrl = url{
                    completionBlock(imageUrl, nil)
                }else{
                    completionBlock(nil,error?.localizedDescription)
                }
            
        })
    }
            uploadTask.observe(.progress) { (snapshot) in
                guard let progress = snapshot.progress else{
                    return
                }
                let percentage = (Double(progress.completedUnitCount) / Double(progress.totalUnitCount)) * 100
                progressBlock(percentage)
                
            }
        }else{
            completionBlock(nil,"Images couldn't be converted to Data")
        }
        
    }
    
    
}
