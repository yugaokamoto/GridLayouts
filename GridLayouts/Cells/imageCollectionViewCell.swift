//
//  imageCollectionViewCell.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/08.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class imageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    func fillWith(_ car:Car){
        imageView.image = car.image
        nameLabel?.text = car.name
        if let price = car.price{
            priceLabel?.text = "$\(price)"
    }
}

}
