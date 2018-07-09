//
//  CarGroupCollectionViewDatasource.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class CarGroupDatasource: NSObject, UICollectionViewDataSource {
    
    private var carGroup: CarGroups!
    
    init(carGroup:CarGroups){
        super.init()
        self.carGroup = carGroup
    }
    
    func numberOfCars() -> Int{
        return carGroup.numberOfCars()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carGroup.numberOfCars()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "swipCell", for: indexPath) as! imageCollectionViewCell
        
        let car = carGroup.carAt(indexPath)
        cell.fillWith(car)
        
        return cell
    }
    

    
}
