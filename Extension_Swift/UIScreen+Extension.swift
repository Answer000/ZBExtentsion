//
//  UIScreen+Extension.swift
//  ZBExtentsionDemo
//
//  Created by 澳蜗科技 on 2017/8/31.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

public enum IPhoneType : UInt {
    case iphone_320x480 = 1000
    case iphone_320x568 = 1001
    case iphone_375x667 = 1002
    case iphone_414x736 = 1003
}

extension UIScreen {

    public class func width() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    public class func height() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    public class func size() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    public class func bounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    public class func scale() -> CGFloat {
        return UIScreen.main.scale
    }
    
    public class func iphoneType() -> IPhoneType {
        switch size() {
            case CGSize.init(width: 320, height: 568):
                return .iphone_320x568
            case CGSize.init(width: 375, height: 667):
                return .iphone_375x667
            case CGSize.init(width: 414, height: 736):
                return .iphone_414x736
            default:
                return .iphone_320x480
        }
    }
}
