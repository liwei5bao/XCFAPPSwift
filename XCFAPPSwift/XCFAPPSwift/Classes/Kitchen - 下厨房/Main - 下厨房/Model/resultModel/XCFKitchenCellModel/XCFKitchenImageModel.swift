//
//  XCFKitchenImageModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenImageModel: NSObject {
    ///图片地址
    var url:String?
    ///图片宽度
    var width:NSNumber?
    ///图片高度
    var height:NSNumber?{
        didSet{
            if (self.height != nil) {
                self.height = (CGFloat(self.height!.floatValue) * screenWidth / CGFloat((self.width?.floatValue)!))
            }else{
                self.height = 0
            }
        }
    }
}
