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
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.titleLabel?.font = UIFont.systemFontOfSize(12 * scaleSize)
        self.setTitleColor(UIColor.colorWithHexString("#37372e"), forState: UIControlState.Normal)
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.top = 0
        self.imageView?.width = self.width * 0.7
        self.imageView?.height = self.height * 3 / 4 * 0.7
        self.imageView?.centerX = self.width * 0.5
        self.titleLabel?.left  = 0
        self.titleLabel?.top = (self.imageView?.height)! - 5 * scaleSize
        self.titleLabel?.width = self.width
        self.titleLabel?.height = self.height * 1 / 4
        
    }
}