//
//  XCFKitchenHeaderNavView.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenHeaderNavView: UIView {
    ///按钮的宽
    let navBtnW:CGFloat = 80 * scaleSize
    ///按钮的高
    let navBtnH:CGFloat = 100 * scaleSize
    ///按钮的点击事件
    var navBtnClick:((index:Int)->())?
    
    ///初始化方法((index: Int) -> Void)
    convenience init(frame: CGRect,navModel:XCFKitchenHeaderModel,btnClick:((index: Int) -> Void)) {
        self.init(frame:frame)
        self.navBtnClick = btnClick
        self.setupNavButtons(navModel)
    }
    
    ///创建子按钮
    private func setupNavButtons(navModel:XCFKitchenHeaderModel){
        let tempViewW:CGFloat = screenWidth / 4
    
        if ((navModel.navs?.count != nil) && (navModel.navs?.count != 0)) {
            for i in 0..<navModel.navs!.count {
                let model = navModel.navs![i] as! XCFKitchenNavsModel
                //添加一个空View
                let tempView = UIView()
                let tempViewX:CGFloat = CGFloat(i) * tempViewW
                let tempViewY:CGFloat = 0
                tempView.frame = CGRect.init(x: tempViewX, y: tempViewY, width: tempViewW, height: navBtnH)
                self.addSubview(tempView)
                //创建导航按钮放在空view里
                let navBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: navBtnW, height: navBtnH))
                if (model.picurl != nil) {
                   navBtn.sd_setImageWithURL(NSURL.init(string: model.picurl!), forState: UIControlState.Normal)
                }
                if (model.name != nil) {
                   navBtn.setTitle(model.name, forState: UIControlState.Normal)
                }
                tempView.addSubview(navBtn)
                navBtn.center = CGPoint.init(x: tempViewW * 0.5, y: navBtnH * 0.5)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
