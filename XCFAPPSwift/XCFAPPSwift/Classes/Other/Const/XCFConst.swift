//
//  XCFConst.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//  项目中的一些常量

import UIKit

///下厨房 - 菜谱cell中控件的字体大小
enum XCFLableFontSize:Int{
    case Describe = 12    //描述
    case Title = 16       //标题
    case FirstTitle = 20  //大标题
    case SecondTitle = 14 //小标题
}
//MARK:屏幕的尺寸
let screenBounds = UIScreen.mainScreen().bounds
///屏幕宽度
let screenWidth = screenBounds.size.width
///屏幕高度
let screenHeight = screenBounds.size.height
///尺寸字体比例
let scaleSize = screenWidth / 375
///下厨房首页headerView的高度
let XCFKitchenHeaderViewH = 130 * scaleSize + 80 * scaleSize + 80 * scaleSize