//
//  ColorExtension.swift
//  GridLayouts
//
//  Created by 岡本　優河 on 2018/07/09.
//  Copyright © 2018年 岡本　優河. All rights reserved.
//

import UIKit

extension UIColor {

    
    static func rbgcolor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat = 1.0) -> UIColor{
        
        return UIColor(red:r/255.0 , green: g/255.0 , blue: b/255.0 , alpha: a)
    }
}
