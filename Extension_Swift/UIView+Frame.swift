//
//  UIView+Extention.swift
//
//  Created by 澳蜗科技 on 2017/4/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//
import UIKit

extension UIView{
    
    @discardableResult
    public func x(_ offset: CGFloat) -> UIView {
        var r = self.frame
        r.origin.x = offset
        self.frame = r
        return self
    }
    public func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    
    @discardableResult
    public func y(_ offset: CGFloat) -> UIView {
        var r = self.frame
        r.origin.y = offset
        self.frame = r
        return self
    }
    public func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    
    /// 右边界的x值
    public func right() -> CGFloat {
        return self.x() + self.width()
    }
    
    
    /// 下边界的y值
    public func bottom() -> CGFloat {
        return self.y() + self.height()
    }
    
    
    @discardableResult
    public func centerX(_ offset: CGFloat) -> UIView {
        self.center = CGPoint.init(x: offset, y: self.centerY())
        return self
    }
    public func centerX() -> CGFloat {
        return self.center.x
    }
    
    
    @discardableResult
    public func centerY(_ offset: CGFloat) -> UIView {
        self.center = CGPoint.init(x: self.centerX(), y: offset)
        return self
    }
    public func centerY() -> CGFloat {
        return self.center.y
    }
    
    
    @discardableResult
    public func width(_ offset: CGFloat) -> UIView {
        var r = self.frame
        r.size.width = offset
        self.frame = r
        return self
    }
    public func width() -> CGFloat {
        return self.frame.size.width
    }
    
    
    @discardableResult
    public func height(_ offset: CGFloat) -> UIView {
        var r = self.frame
        r.size.height = offset
        self.frame = r
        return self
    }
    public func height() -> CGFloat {
        return self.frame.size.height
    }
    
    
    @discardableResult
    public func origin(_ point: CGPoint) -> UIView {
        return self.x(point.x).y(point.y)
    }
    public func origin() -> CGPoint {
        return self.frame.origin
    }
    
    
    @discardableResult
    public func size(_ size: CGSize) -> UIView {
        return self.width(size.width).height(size.height)
    }
    public func size() -> CGSize {
        return self.frame.size
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
    
    public func getResponder_super(responderClass: Swift.AnyClass?) -> AnyObject? {
        guard let responderClass = responderClass else {
            return nil
        }
        var responder : UIResponder? = self
        while responder != nil {
            if (responder?.isKind(of: responderClass.self)) == true {
                return responder.self
            }
            responder = responder?.next
        }
        return nil
    }
}
