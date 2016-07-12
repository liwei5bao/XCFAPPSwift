//
//  XCFServerAPI.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

//MARK:提示信息
let XCFRequestError = "服务器不小心走丢了,请稍后再试..."

//MARK:API
/** 下厨房 - 导航数据 */
let XCFRequestKitchenNav = "http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA"

/** 下厨房 - 关注动态 */
let XCFRequestKitchenFeeds = "http://api.xiachufang.com/v2/account/feeds_v3.json?offset=0&origin=iphone&api_sign=5682ea5db42972d13cc17bc1401000fe&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=10&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"