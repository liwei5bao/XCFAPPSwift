//
//  XCFKitchenNavBtn.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import MJExtension
class XCFKitchenNavBtn: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.font = UIFont.systemFontOfSize(12 * scaleSize)
        self.setTitleColor(UIColor.colorWithHexString("#37372e"), forState: UIControlState.Normal)
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.imageView?.contentMode = UIViewContentMode.Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.left = 0
        self.imageView?.top = 0
        self.imageView?.width = self.width
        self.imageView?.height = self.height * 3 / 4
        self.titleLabel?.left  = 0
        self.titleLabel?.top = (self.imageView?.height)! - self.height/20
        self.titleLabel?.width = self.width
        self.titleLabel?.height = self.height * 1 / 4
    }
}