//
//  CarGroups.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class CarGroups: NSObject {

   private var cars : [Car] = []
    
    init(cars:[Car]){
        super.init()
        self.cars = cars
    }
    
    func numberOfCars() -> Int{
        return cars.count
    }
    
    func carAt(_ indexPath:IndexPath) -> Car{
        return cars[indexPath.item]
    }
}
