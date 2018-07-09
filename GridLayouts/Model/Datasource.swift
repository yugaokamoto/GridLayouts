//
//  Datasorce.swift
//  GridLayout
//
//  Created by 岡本　優河 on 2018/07/08.
//  Copyright © 2018年 Sabminder. All rights reserved.
//

import UIKit

class Datasorce: NSObject,UICollectionViewDataSource {
    
    private var itemsTodisplay:[Any] = []
    
    override init(){
        super.init()
        
        let carArray = [Car(objectID: "12", name: "ferrafi", price: 120000, salePlace: 118000, carDescription: "gagaakeajkgjaskdgaks", image: UIImage(named: "ferrari")),
                        Car(objectID: "13", name: "porshe", price: 130000, salePlace: 218000, carDescription: "gagaakeajkgjaskdgaks", image: UIImage(named: "porshe"))]
        let carGroup = CarGroups(cars: carArray)
        
        itemsTodisplay = [carGroup,Car(objectID: "15", name: "Audi", price: 145000, salePlace: 419000, carDescription: "gagaakeajkgjaskdgaks", image: UIImage(named: "Audi")),
                         Car(objectID: "14", name: "BmW", price: 140000, salePlace: 318000, carDescription: "gagaakeajkgjaskdgaks", image: UIImage(named: "BmW")),
                         Banner(title: "Your perfect car is waitting for you. Grab it now with 10% discount.", buttonTitle: "Shop now", urlString: "https://www.youtube.com/watch?v=HKfkH5OTRwc"),
                         Car(objectID: "15", name: "lamborghini", price: 150000, salePlace: 518000, carDescription: "gagaakeajkgjaskdgaks", image: UIImage(named: "lamborghini")),
                         Car(objectID: "16", name: "honda", price: 160000, salePlace: 618000, carDescription: "gagaakeajkgjaskdgaks", image: UIImage(named: "honda"))]
    }
    
    func itemsAt(_ indexPath: IndexPath) -> Any{
        return itemsTodisplay[indexPath.item]
    }
    
    //MARK:collectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsTodisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = itemsTodisplay[indexPath.item]
        
        if let car = item as? Car{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCollectionViewCell
            cell.fillWith(car)
            return cell
        }else if let banner = item as? Banner{
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! bannerCollectionViewCell
            bannerCell.fillWith(banner)
            return bannerCell
        }else if let carGroup = item as? CarGroups{
            let carGroupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "carGroupCell", for: indexPath) as! CarGroupCollectionViewCell
            carGroupCell.fillWith(carGroup)
            return carGroupCell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCollectionViewCell
            return cell
        }

   }

}
