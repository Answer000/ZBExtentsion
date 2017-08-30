//
//  UIImage+Extension.swift
//
//  Created by 澳蜗科技 on 2017/4/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 切角
    /// - parameter radius:    半径
    /// - parameter fillSize:  生成新图片的大小
    /// - parameter fillColor: 填充颜色
    /// - parameter finished:  绘制完成后闭包返回新图片
    
    public func imageClipWithCorner(radius: CGFloat,
                                    fillSize: CGSize,
                                    fillColor: UIColor,
                                    finished:@escaping (_ newImage: UIImage)->()) {
        /****** 异步裁切图片 *******/
        DispatchQueue.global().async {
            /****** 开启上下文 *******/
            UIGraphicsBeginImageContextWithOptions(fillSize, true, 0)
            let rect = CGRect(x: 0, y: 0, width: fillSize.width, height: fillSize.height)
            /****** 设置绘图路径 *******/
            let path = UIBezierPath.init(roundedRect: rect, cornerRadius: radius)
            /****** 设置填充颜色 *******/
            fillColor.setFill()
            UIRectFill(rect)
            /****** 裁切 *******/
            path.addClip()
            /****** 绘制上下文内容 *******/
            self.draw(in: rect)
            /****** 获取新图片 *******/
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            /****** 关闭上下文 *******/
            UIGraphicsEndImageContext()
            
            /****** 在主线程中将新图片返回 *******/
            DispatchQueue.main.async(execute: {
                guard let image = newImage else {
                    return
                }
                finished(image)
            })
        }
    }
    
    
    /// 切圆
    /// - parameter fillSize:  生成新图片的大小
    /// - parameter fillColor: 填充颜色
    /// - parameter finished:  绘制完成后闭包返回新图片
    
    public func imageClipWtihOval(fillSize: CGSize,
                           fillColor: UIColor,
                           finished:@escaping (_ newImage: UIImage)->()) {
        imageClipWithCorner(radius: min(fillSize.width, fillSize.height),
                            fillSize: fillSize,
                            fillColor: fillColor,
                            finished: finished)
    }
}


