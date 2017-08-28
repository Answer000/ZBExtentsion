//
//  UIColor+Extension.swift
//
//  Created by 澳蜗科技 on 2017/4/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension UIColor {
    class func hexColorWith(hexVale: UInt32) ->UIColor {
        let r  =  (hexVale & 0xFF0000) >> 16
        let g = (hexVale & 0x00FF00) >> 8
        let b = hexVale & 0x0000FF
        
        return UIColor.init(red: CGFloat(r) / CGFloat(255), green: CGFloat(g) / CGFloat(255), blue: CGFloat(b) / CGFloat(255), alpha: 1.0)
    }
    
    class func hexColorWith(hexVale: UInt32, alpha: CGFloat) ->UIColor {
        let r  =  (hexVale & 0xFF0000) >> 16
        let g = (hexVale & 0x00FF00) >> 8
        let b = hexVale & 0x0000FF
        return UIColor.init(red: CGFloat(r) / CGFloat(255), green: CGFloat(g) / CGFloat(255), blue: CGFloat(b) / CGFloat(255), alpha: alpha)
    }
}


extension UIColor {
    class func getRGBWithColor(color : UIColor) ->(a: CGFloat, r: CGFloat, g:CGFloat, b:CGFloat)? {
        var a : CGFloat = 0
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        
        if color.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (a,r,g,b)
        }
        return nil
    }
}
