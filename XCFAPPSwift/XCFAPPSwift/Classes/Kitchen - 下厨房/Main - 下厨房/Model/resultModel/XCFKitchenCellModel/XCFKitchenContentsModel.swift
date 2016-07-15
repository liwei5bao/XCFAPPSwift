//
//  XCFKitchenContentsModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenContentsModel: NSObject {
    /** 模板分类1/2/4/5/6 */
    ///图片内容
    var image:XCFKitchenImageModel?
    /** 模板1/5 */
    ///标题
    var title:String?
    ///描述
    var desc:String?
    /** 模板2 */
    ///大标题
    var title_1st:String?
    ///小标题
    var title_2nd:String?
    /** 模板4 */
    ///标题
    var whisper:String?
    /** 模板5 */
    ///视频地址
    var video_url:String?
    ///作者
    var author:XCFKitchenAuthorModel?
    ///做过的人数
    var n_cooked:NSInteger?
    ///
    var n_dishes:NSInteger?
    ///分数
    var score:NSInteger?
    ///食谱id
    var recipe_id:String?
}
