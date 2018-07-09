//
//  bannerCollectionViewCell.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class bannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var actionButton:UIButton!
    
    private var bannerToDisplay: Banner?
    
    static func cellHeight() -> CGFloat{
        return 70.0
    }
    
    @IBAction func actionButtonPressed(){
        guard let banner = bannerToDisplay,let url = banner.url() else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bannerToDisplay = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //ToDo: Customazation
    }
    
    func fillWith(_ banner:Banner){
        titleLabel.text = banner.title
        actionButton.setTitle(banner.buttonTitle, for: .normal)
        
        bannerToDisplay = banner
    }
    
}
