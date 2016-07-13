//
//  XCFKitchenScrollowDetailV.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/13.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import MJExtension
import Masonry
class XCFKitchenScrollowDetailV: UIView {

    ///图片的点击方法
    var imageViewClick:((index:Int)->())?
    ///背景图
    var backImageView = UIImageView()
    ///右侧小图
    var rightImageView = UIImageView()
    ///标题
    var titleLabel = UILabel()
    /// 作品数
    var dishCountLabel = UILabel()
    ///边距
    let marginSpace:CGFloat = 10 * scaleSize
    let rightImageW:CGFloat = 70 * scaleSize
    let imageViewH:CGFloat = 80 * scaleSize
    convenience init(frame: CGRect,pageModel:XCFKitchenPopEventModel,click:((index:Int)->())) {
        self.init(frame: frame)
        self.imageViewClick = click
        self.setupPageSubViews(pageModel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.addSubview(backImageView)
        self.rightImageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(rightImageView)
        self.titleLabel.font = UIFont.systemFontOfSize(CGFloat(XCFLableFontSize.Title.rawValue))
        self.addSubview(titleLabel)
        self.dishCountLabel.font = UIFont.systemFontOfSize(CGFloat(XCFLableFontSize.Describe.rawValue))
        self.dishCountLabel.textColor = UIColor.lightGrayColor()
        self.addSubview(dishCountLabel)
    }
    
    ///初始化子控件
    private func setupPageSubViews(pageModel:XCFKitchenPopEventModel){
        if (pageModel.thumbnail_280 != nil) {
            self.rightImageView.sd_setImageWithURL(NSURL.init(string: pageModel.thumbnail_280!), placeholderImage: placeholderImage)
        }
        if (pageModel.name != nil) {
            let nameStr = NSString(format: "%@",pageModel.name!).substringToIndex(2)
            self.titleLabel.text = "-- " + nameStr + " --"
            self.titleLabel.sizeToFit()
            if (nameStr == "早餐") {
                self.backImageView.image = UIImage.init(named: "themeSmallPicForBreakfast")
            }else if (nameStr == "午餐"){
                self.backImageView.image = UIImage.init(named: "themeSmallPicForLaunch")
            }else if (nameStr == "晚餐"){
                self.backImageView.image = UIImage.init(named: "themeSmallPicForSupper")
            }
            
        }
        if (pageModel.n_dishes != nil) {
            self.dishCountLabel.text = pageModel.n_dishes! + "作品"
            self.dishCountLabel.sizeToFit()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backImageView.frame = self.bounds
        rightImageView.frame = CGRect.init(x: screenWidth - marginSpace - rightImageW, y: marginSpace, width: rightImageW, height: imageViewH - 2 * marginSpace)
        titleLabel.centerX = screenWidth * 0.5
        titleLabel.centerY = self.centerY - 10
        dishCountLabel.centerX = screenWidth * 0.5
        dishCountLabel.centerY = self.centerY + 10
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
