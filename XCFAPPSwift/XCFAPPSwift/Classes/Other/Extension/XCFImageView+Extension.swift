//
//  XCFImageView+Extension.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

import Foundation


extension UIButton{
    //加载圆形头像
    func setHeaderWithURL(urlStr:String) {
        let url = NSURL.init(string: urlStr)
        self.sd_setImageWithURL(url, forState: UIControlState.Normal, placeholderImage: placeholderImage?.circleImage()) { (image, NSError, SDImageCacheType, NSURL) in
            self.setImage(image.circleImage(), forState: UIControlState.Normal)
        }
    }
}

extension UIImageView{
    //加载圆形头像
    func setHeaderWithURL(urlStr:String) {
        let url = NSURL.init(string: urlStr)
        self.sd_setImageWithURL(url!, placeholderImage: placeholderImage!.circleImage()) { (image, NSError, SDImageCacheType, NSURL) in
           self.image = image!.circleImage()
        }
    }
}

extension UIImage{
    
    func circleImage() -> UIImage {
        
        //1.开启图形上下文
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        //2.获取图形上下文
        let ctx = UIGraphicsGetCurrentContext()
        //3.添加一个圆
        let rect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        CGContextAddEllipseInRect(ctx, rect)
        //4.裁剪
        CGContextClip(ctx)
        //5.画图
        self.drawInRect(rect)
        //6.取出图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //7.关闭上下文
        UIGraphicsEndImageContext()
        return image
    }
}