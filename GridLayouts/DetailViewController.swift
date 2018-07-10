//
//  DetailViewController.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit
import Haneke
class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var selectedCar:Car!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    title = selectedCar.name
        if let image = selectedCar.image {
         imageView.image = image
        }else{
            if let imageURL = selectedCar.imageURL{
                imageView.hnk_setImage(from: imageURL)
            }
        }
   
    nameLabel.text = selectedCar.name
        if let price = selectedCar.price{
            priceLabel.text = "$\(price)"
        }else{
            priceLabel.isHidden = true
        }
        
    
    }

    

}
