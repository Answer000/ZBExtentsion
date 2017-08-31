//
//  NSString+Extension.swift
//  ZBExtentsionDemo
//
//  Created by 澳蜗科技 on 2017/8/30.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension NSString {
    
    // return      字符串的实际size
    // fitSize     最大size
    // attributes  富文本属性
    public func getSizeFromString(fitSize: CGSize,
                                  attributes: [String : Any]?) -> CGSize {
        if self.length == 0 {
            return .zero
        }
        let resutlSize = self.boundingRect(with: fitSize,
                                           options: [.usesLineFragmentOrigin],
                                           attributes: attributes,
                                           context: nil)
        return resutlSize.size
    }
    
    // 从字符串中提取数字
    public func getNumberFromString() -> Array<Float>?{
        if self.length == 0  { return nil }
        let result = (self as String)
            .characters
            .split(omittingEmptySubsequences: true) {
                !".0123456789".contains(String($0))
            }.map {Float(String($0))!}
            .filter {$0 != nil }
        return result
    }
    
}
