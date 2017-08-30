//
//  NSString+AttributedString.swift
//  DDLottery
//
//  Created by 澳蜗科技 on 2017/5/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension UILabel {
    
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

