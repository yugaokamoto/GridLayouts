//
//  Car.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/08.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class Car: NSObject {
    var objectID:String!
    var name:String!
    var price:NSNumber?
    var salePlace:NSNumber?
    var carDescription: String?
    var image:UIImage!
    var imageURL:URL?
    
    init(objectID:String!,name:String!,price:NSNumber?,salePlace:NSNumber?,carDescription: String?,image:UIImage!){
        
        self.objectID = objectID
        self.name = name
        self.price = price
        self.salePlace = salePlace
        self.carDescription = carDescription
        self.image = image
    }
}
