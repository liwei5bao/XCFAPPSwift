//
//  XCFDishModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//  作品

import UIKit

class XCFDishModel: NSObject {
    /** 最后评论 */
    var latest_comments:NSArray?
    /** 分享才有的数据 */
    var events:NSArray?
    /** 附加图 */
    var extra_pics:NSArray?
    
    /** 标识（图片名字） */
    var ident:String?
    /** 图片地址（尺寸600） */
    var photo:String?
    /** 缩略图（尺寸160） */
    var thumbnail:String?
    var thumbnail_160:String?
    var thumbnail_280:String?
    /** 显示时间 */
    var friendly_create_time:String?
    /** 创建时间 */
    var create_time:String?
    /** 图片总数 */
    var npics:NSNumber?
    /** 评论数 */
    var ncomments:String?
    /** 发表动态的作者 */
    var author:XCFKitchenAuthorModel?
    /** 菜谱名称\要显示的标题 */
    var name:String?
    /** 文字描述 */
    var desc:String?
    /** 主图 */
    var main_pic:String?
    /** 菜谱id */
    var ID:String?
    /** 点赞数 */
    var ndiggs:String?
    /** 点赞用户 */
    var digg_users:XCFDiggUsers?
    /** 菜谱id 返回值一直是0 */
    var recipe_id:String?
    /** 是否为分享的内容 */
    var is_orphan:NSNumber?
    var digged_by_me:NSNumber?
    
    /** 作品cellHeight */
    var dishCellHeight:CGFloat?
    /** 作品commentViewHeight */
    var commentViewHeight:CGFloat?
    
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["latest_comments":XCFCommentModel.self,"events":XCFDishModel.self,"extra_pics":XCFPicture.self]
    }
}
