//
//  XCFRecipeStatsModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//  菜谱的状态

import UIKit

class XCFRecipeStatsModel: NSObject {
    ///被收藏次数
    var n_collects:String?
    ///评论数
    var n_comments:String?
    ///做过的人数
    var n_cooked:String?
    ///作品数
    var n_dishes:String?
    ///最近7天做过人数
    var n_cooked_last_week:String?
    ///是否由我制作
    var cooked_by_me:NSNumber?
    ///
    var n_pv:String?
}
