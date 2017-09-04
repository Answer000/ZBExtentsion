//
//  NSString+AttributedString.swift
//  DDLottery
//
//  Created by 澳蜗科技 on 2017/5/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension UILabel {
    
    @discardableResult
    public func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func textColor(_ color: UIColor?) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func shadowColor(_ color: UIColor?) -> Self {
        self.shadowColor = color
        return self
    }
    
    @discardableResult
    public func shadowOffset(_ offset: CGSize) -> Self {
        self.shadowOffset = offset
        return self
    }
    
    @discardableResult
    public func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    public func attributedText(_ text: NSAttributedString?) -> Self {
        self.attributedText = text
        return self
    }
    
    @discardableResult
    public func highlightedTextColor(_ color: UIColor?) -> Self {
        self.highlightedTextColor = color
        return self
    }
    
    @discardableResult
    public func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    @discardableResult
    public func isEnabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }
    
    @discardableResult
    public func numberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }
    
}


extension UILabel {
    
    public class func creatLabel(text: String?,
                                 font: UIFont?,
                                 textColor: UIColor?,
                                 textAlignment: NSTextAlignment) -> UILabel {
        return {
            let label = UILabel.init()
            label.text = text
            label.textColor = textColor
            label.font = font
            label.textAlignment = textAlignment
            return label
            }()
    }
    
    // 默认对齐方式：.left
    public class func creatLabel(text: String?,
                                 font: UIFont?,
                                 textColor: UIColor?) -> UILabel {
        return creatLabel(text: text,
                          font: font,
                          textColor: textColor,
                          textAlignment: .left)
    }
    
    // 默认对齐方式：.left
    // 默认字体颜色：.darkText
    public class func creatLabel(text: String?,
                                 font: UIFont?) -> UILabel {
        return creatLabel(text: text,
                          font: font,
                          textColor: UIColor.darkText,
                          textAlignment: .left)
    }
    
    // 默认对齐方式：.left
    // 默认字体颜色：.darkText
    // 默认字体大小：UIFont.systemFont(ofSize: 14)
    public class func creatLabel(text: String?) -> UILabel {
        return creatLabel(text: text,
                          font: UIFont.systemFont(ofSize: 14),
                          textColor: UIColor.darkText,
                          textAlignment: .left)
    }
}


extension UILabel {
    
    // 修改UILabel的部分文字颜色
    // text :       字符内容
    // startIndex : 开始的下标值
    // length :     长度
    // color :      颜色
    public func attributeString(text: String?,
                                startIndex: NSInteger,
                                length: NSInteger,
                                color: UIColor?) {
        attributeString(text: text,
                        startIndex: startIndex,
                        length: length,
                        color: color,
                        font: self.font)
    }
    
    // 修改UILabel的部分文字颜色和字体
    // text :       字符内容
    // startIndex : 开始的下标值
    // length :     长度
    // color :      颜色
    // font :       字体
    public func attributeString(text: String?,
                                startIndex: NSInteger,
                                length: NSInteger,
                                color: UIColor?,
                                font: UIFont) {
        guard let text = text else {
            print("************* text 不能为 nil *************")
            return
        }
        let textLength : NSInteger = text.characters.count
        var startIndex = startIndex
        var length = length
        
        if startIndex >= textLength {
            startIndex = textLength
            length = 0
        }
        if startIndex + length > textLength {
            length = textLength - startIndex
        }
        
        let attributeRange : NSRange = NSMakeRange(startIndex, length)
        let attributeString = NSMutableAttributedString.init(string: text, attributes: [NSForegroundColorAttributeName : textColor, NSFontAttributeName : self.font])
        attributeString.addAttribute(NSForegroundColorAttributeName, value: color! , range: attributeRange)
        attributeString.addAttribute(NSFontAttributeName, value: font, range: attributeRange)
        
        self.attributedText = attributeString
    }
}

