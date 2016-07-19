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
/** 下厨房 - 首页数据 */
let XCFRequestKitchenListNew = "http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=069310ae4fc0b866207dba71320f1c13&sk=7UnwJ-JkQ36hbfrMRoL0fA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"
/** 下厨房 - 首页更多数据 */
let XCFRequestKitchenListMore = "http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=069310ae4fc0b866207dba71320f1c13&sk=7UnwJ-JkQ36hbfrMRoL0fA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"
/** 下厨房 - 导航数据 */
let XCFRequestKitchenNav = "http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA"
/** 下厨房 - 关注动态 */
let XCFRequestKitchenFeeds = "http://api.xiachufang.com/v2/account/feeds_v3.json?offset=0&origin=iphone&api_sign=5682ea5db42972d13cc17bc1401000fe&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=10&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"

/** 下厨房 - cell跳转数据 - 模板5 菜谱详情 */
let XCFRequestKitchenRecipe = "http://api.xiachufang.com/v2/recipes/show_v2.json?origin=iphone&mode=full&id=101773324&api_sign=6332fd2dc5517a725cc5a7fb8e58ea5e&sk=7UnwJ-JkQ36hbfrMRoL0fA&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"
/** 下厨房 - cell跳转数据 - 模板5 菜谱内作品详细数据 */
let XCFRequestKitchenRecipeDish = "http://api.xiachufang.com/v2/dishes/lookup_v2.json?version=5.1.1&id=115422648%2C115406797%2C115405331%2C115400878&api_sign=ca8aa5cbae7ce01e2c705e4cef02c0ac&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA"
/** 下厨房 - cell跳转数据 - 模板5 菜谱“被加入的菜单”数据 */
let XCFRequestKitchenAddedRecipeList = "http://api.xiachufang.com/v2/recipes/101773324/related_recipe_lists_v2.json?detail=true&offset=0&origin=iphone&api_sign=13227ccd1adc16087e67960be8b45457&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=2&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"