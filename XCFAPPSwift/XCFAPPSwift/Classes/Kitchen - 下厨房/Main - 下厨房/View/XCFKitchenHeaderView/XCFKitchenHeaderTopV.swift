//
//  XCFKitchenHeaderTopV.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import MJExtension
///点击回调
var imageClick:((index:Int)->())?

class XCFKitchenHeaderTopV: UIView {
    ///图片高度
    let imageButtonH:CGFloat = 130 * scaleSize
    ///文字头部位置
    let titleLableTop = 100 * scaleSize
    
    convenience init(frame: CGRect ,pop_recipe_picurl:String,focusImageViewClick:((index: Int) -> Void)) {
        self.init(frame: frame)
        imageClick = focusImageViewClick
        self.setupSubViews(pop_recipe_picurl)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    private func setupSubViews(pop_recipe_picurl:String){
        let imageButtonW = screenWidth * 0.5 - 0.5
        for i in 0...1 {
            let imageButtonX = CGFloat(i) * (imageButtonW + 1)
            let imageButtonY = CGFloat(0)
            let imageButton = UIButton.init(type: UIButtonType.Custom)
            imageButton.sd_setBackgroundImageWithURL(NSURL.init(string: pop_recipe_picurl), forState: UIControlState.Normal)
            imageButton.frame = CGRect.init(x: imageButtonX, y: imageButtonY, width: imageButtonW, height: imageButtonH)
            self.addSubview(imageButton)
            
            //添加一层蒙版
            let menuBtn = UIButton.init(frame: imageButton.bounds)
            menuBtn.tag = i
            menuBtn.backgroundColor = XCFCoverViewColor
            imageButton.addSubview(menuBtn)
            menuBtn.addTarget(self, action: #selector(XCFKitchenHeaderTopV.imageButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            //文字显示
            let titleL = UILabel()
            if (i == 0) {
                titleL.text = "本周流行菜谱"
            }else{
                titleL.text = "查看好友并关注"
            }
            titleL.textAlignment = NSTextAlignment.Center
            titleL.font = UIFont.systemFontOfSize(14)
            titleL.textColor = UIColor.whiteColor()
            titleL.frame = CGRect.init(x: 0, y: titleLableTop, width: imageButtonW, height: 16)
            imageButton.addSubview(titleL)
        }
    }
    
    //按钮的点击
    func imageButtonClick(btn:UIButton){
        if ((imageClick) != nil) {imageClick!(index: btn.tag)}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
