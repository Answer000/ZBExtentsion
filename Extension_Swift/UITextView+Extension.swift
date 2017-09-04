//
//  UITextView+Extension.swift
//  ZBExtentsionDemo
//
//  Created by 澳蜗科技 on 2017/9/1.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension UITextView {
    
    @discardableResult
    public func delegate(_ object: UITextViewDelegate?) -> Self {
        self.delegate = object
        return self
    }
    
    @discardableResult
    public func text(_ text: String!) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func textColor(_ color: UIColor?) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    public func selectedRange(_ range: NSRange) -> Self {
        self.selectedRange = range
        return self
    }
    
    @discardableResult
    public func isEditable(_ editable: Bool) -> Self {
        self.isEditable = editable
        return self
    }
    
    @discardableResult
    public func isSelectable(_ isable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }
    
    @discardableResult
    public func dataDetectorTypes(_ types: UIDataDetectorTypes) -> Self {
        self.dataDetectorTypes = types
        return self
    }
    
    @discardableResult
    public func allowsEditingTextAttributes(_ isAllows: Bool) -> Self {
        self.allowsEditingTextAttributes = isAllows
        return self
    }

    @discardableResult
    public func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }

    @discardableResult
    public func typingAttributes(_ typingAttributes: [String : Any]) -> Self {
        self.typingAttributes = typingAttributes
        return self
    }

    @discardableResult
    public func inputView(_ view: UIView?) -> Self {
        self.inputView = view
        return self
    }
    
    @discardableResult
    public func inputAccessoryView(_ accessoryView: UIView?) -> Self {
        self.inputAccessoryView = accessoryView
        return self
    }
    
    @discardableResult
    public func clearsOnInsertion(_ isClears: Bool) -> Self {
        self.clearsOnInsertion = clearsOnInsertion
        return self
    }

    @discardableResult
    public func textContainerInset(_ inset: UIEdgeInsets) -> Self {
        self.textContainerInset = inset
        return self
    }
    
    @discardableResult
    public func linkTextAttributes(_ linkTextAttributes: [String : Any]!) -> Self {
        self.linkTextAttributes = linkTextAttributes
        return self
    }
}

extension UITextView {
    
    //  返回一个带有占位文字的UITextView
    //  placeholder  :  占位文字的内容
    //  font         :  字体大小（占位文字默认与UITextView的相同）
    //  textColor    :  字体颜色（占位文字默认与UITextView的相同）
    //  注意：需要在该视图被销毁的时候调用：removeObserverForPlaceholderLabel()
    public class func creatTextView(_ placeholder: String?,
                                    font: UIFont?,
                                    textColor: UIColor?) -> UITextView {
        return {
            let textView = UITextView.init()
            textView.font = font
            textView.textColor = textColor
            
            let placeholderLabel = UILabel.init()
            placeholderLabel.text = placeholder
            placeholderLabel.font = font
            placeholderLabel.textColor = textColor
            placeholderLabel.frame.origin.x = 5
            placeholderLabel.frame.origin.y = 8
            placeholderLabel.tag = 6666
            placeholderLabel.sizeToFit()
            textView.addSubview(placeholderLabel)
            
            // 添加观察者，监听文字内容变化
            NotificationCenter.default.addObserver(textView,
                                                   selector: #selector(textViewDidChanged(info:)),
                                                   name: .UITextViewTextDidChange,
                                                   object: nil)
            return textView
        }()
    }
    
    // 监听文字改变
    func textViewDidChanged(info: NSNotification)  {
        guard let textView = info.object as? UITextView else {
            return
        }
        guard let placeholderLabel = textView.viewWithTag(6666) else {
            return
        }
        placeholderLabel.isHidden = textView.hasText
    }
    
    // 判断是否有占位的Label
    public func hasPlaceholder() ->Bool {
        guard let placeholder = self.viewWithTag(6666) else {
            return false
        }
        return placeholder.isKind(of: UILabel.self)
    }
    
    // 修改占位内容
    public func placeholderText(_ string: String?) -> Self {
        if let placeholder = self.viewWithTag(6666) as? UILabel {
            placeholder.text = string
            placeholder.sizeToFit()
        }
        return self
    }
    
    // 修改占位文字的字体
    public func placeholderFont(_ font: UIFont) -> Self {
        if let placeholder = self.viewWithTag(6666) as? UILabel {
            placeholder.font = font
        }
        return self
    }
    
    // 修改占位文字的字体颜色
    public func placeholderTextColor(_ color: UIColor?) -> Self {
        if let placeholder = self.viewWithTag(6666) as? UILabel {
            placeholder.textColor = color
        }
        return self
    }
    
    // 调整占位Label的外边距
    public func placeholderEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        if let placeholder = self.viewWithTag(6666) as? UILabel {
            var rect = placeholder.frame
            rect.origin = CGPoint.init(x: insets.left, y: insets.top)
            placeholder.frame = rect
        }
        return self
    }

    // 移除观察者
    public func removeObserverForPlaceholderLabel() {
        if hasPlaceholder() {
            NotificationCenter.default.removeObserver(self,
                                                      name: .UITextViewTextDidChange,
                                                      object: nil)
        }
    }
}

