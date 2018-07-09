//
//  Banner.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

class Banner: NSObject {

    var title:String
    var buttonTitle:String
    var urlString:String
    
    init(title:String,buttonTitle:String,urlString:String){
        self.title = title
        self.buttonTitle = buttonTitle
        self.urlString = urlString
        super.init()
    }
    
    func url() -> URL? {
        return URL(string: urlString)
    }
}
