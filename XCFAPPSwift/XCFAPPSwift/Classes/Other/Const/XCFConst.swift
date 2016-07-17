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

///下厨房 - cell的模板类型
enum XCFKitchenCellTemplate:Int{
    case Topic = 1          //帖子
    case RecipeList = 2     //菜单
    case Unknow = 3         //未知
    case Dish = 4           //作品
    case Recipe = 5         //菜谱
    case WeeklyMagazine = 6 //周刊
}
//MARK:屏幕的尺寸
let screenBounds = UIScreen.mainScreen().bounds
///屏幕宽度
let screenWidth:CGFloat = screenBounds.size.width
///屏幕高度
let screenHeight = screenBounds.size.height
///尺寸字体比例
let scaleSize = screenWidth / 375
///下厨房首页headerView的高度
let XCFKitchenHeaderViewH = 130 * scaleSize + 80 * scaleSize + 80 * scaleSize



/** 下厨房 - 标题距离屏幕左边的间距 */
let XCFRecipeCellMarginTitle:CGFloat = 15;
/** 下厨房 - 大标题距离屏幕左边的间距 */
let XCFRecipeCellMarginFirstTitle:CGFloat = 35;
/** 下厨房 - 描述与标题之间的间距 */
let XCFRecipeCellMarginTitle2Desc:CGFloat = 8;
/** 下厨房 - 菜单 - 标题距离顶部导航的间距 */
let XCFRecipeListViewMarginHeadTitle:CGFloat = 20;
/** 下厨房 - 菜单 - 标题距离作者名字的间距 */
let XCFRecipeListViewMarginHeadTitle2Name:CGFloat = 10;
/** 下厨房 - 菜单 - lable的最大宽度*/
let XCFRecipeCellLableMaxWidth:CGFloat = screenWidth - 40

