//
//  UIView+Extention.swift
//
//  Created by 澳蜗科技 on 2017/4/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//
import UIKit

extension UIView{
    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    /// 右边界的x值
    public var rightX: CGFloat{
        get{
            return self.x + self.width
        }
        set{
            var r = self.frame
            r.origin.x = newValue - frame.size.width
            self.frame = r
        }
    }
    /// 下边界的y值
    public var bottomY: CGFloat{
        get{
            return self.y + self.height
        }
        set{
            var r = self.frame
            r.origin.y = newValue - frame.size.height
            self.frame = r
        }
    }
    public var centerX : CGFloat{
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    public var centerY : CGFloat{
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    public var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    public var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    public var origin: CGPoint{
        get{
            return self.frame.origin
        }
        set{
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    public var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            self.width = newValue.width
            self.height = newValue.height
        }
    }
}


extension UIView {
    public func removeAllFromSuperview() {
        for v in subviews {
            v.removeFromSuperview()
        }
    }
    
    public func viewController_self() -> UIViewController?{
        var responder : UIResponder? = self
        while responder != nil {
            if (responder?.isKind(of: UIViewController.self)) == true {
                return responder as? UIViewController
            }
            responder = responder?.next
        }
        return nil
    }
    
    public func tableView_self() -> UITableView? {
        var responder : UIResponder? = self
        while responder != nil {
            if (responder?.isKind(of: UITableView.self)) == true {
                return responder as? UITableView
            }
            responder = responder?.next
        }
        return nil
    }
}
