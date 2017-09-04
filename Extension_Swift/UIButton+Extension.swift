//
//  UIButton+Extension.swift
//  ZBExtentsionDemo
//
//  Created by 澳蜗科技 on 2017/8/31.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension UIButton {
    
    @discardableResult
    public func contentEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = insets
        return self
    }
    
    @discardableResult
    public func titleEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = insets
        return self
    }
    
    @discardableResult
    public func imageEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = insets
        return self
    }
    
    @discardableResult
    public func tintColor(_ color: UIColor?) -> Self {
        self.tintColor = color
        return self
    }
    
    
    @discardableResult
    public func setTitle(_ title: String?,
                         _ state: UIControlState) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    public func setTitleColor(_ color: UIColor?,
                              _ state: UIControlState) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    public func setTitleShadowColor(_ color: UIColor?,
                                    _ state: UIControlState) -> Self {
        self.setTitleShadowColor(color, for: state)
        return self
    }
    
    @discardableResult
    public func setImage(_ image: UIImage?,
                         _ state: UIControlState) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func setBackgroundImage(_ image: UIImage?,
                                   _ state: UIControlState) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func setAttributedTitle(_ title: NSAttributedString?,
                                   _ state: UIControlState) -> Self {
        self.setAttributedTitle(title, for: state)
        return self
    }
}

extension UIButton {
    
    // 默认字体颜色：UIColor.darkText
    // 默认字体样式：UIFont.systemFont(ofSize: 14)
    public class func creatButton(_ type: UIButtonType) -> UIButton {
        return creatButton(withType: type,
                           attributedText: nil,
                           imageName: nil,
                           backgroundImageName: nil)
    }
    
    // 默认字体颜色：UIColor.darkText
    // 默认字体样式：UIFont.systemFont(ofSize: 14)
    public class func creatButton(withType type: UIButtonType?,
                                  title: String?,
                                  titleColor: UIColor?,
                                  fontSize: CGFloat?,
                                  imageName: String?,
                                  backgroundImageName: String?) -> UIButton {
        
        let attributeText = NSAttributedString.init(string: title ?? "", attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: fontSize ?? 14), NSForegroundColorAttributeName : titleColor ?? UIColor.darkText])
        
        return creatButton(withType: type ?? .custom,
                           attributedText: attributeText,
                           imageName: imageName,
                           backgroundImageName: backgroundImageName)
    }
    
    // 默认字体颜色：系统按钮颜色
    // 默认字体样式：UIFont.systemFont(ofSize: 17)
    public class func creatButton(withType type: UIButtonType,
                                  attributedText: NSAttributedString?,
                                  imageName: String?,
                                  backgroundImageName: String?) ->UIButton {
        return {
            let button = UIButton.init(type: type)
            button.setAttributedTitle(attributedText, for: .normal)
            if let imageName = imageName {
                button.setImage(UIImage.init(named: imageName), for: .normal)
            }
            if let backgroundImageName = backgroundImageName {
                button.setBackgroundImage(UIImage.init(named: backgroundImageName), for: .normal)
            }
            return button
            }()
    }
}
