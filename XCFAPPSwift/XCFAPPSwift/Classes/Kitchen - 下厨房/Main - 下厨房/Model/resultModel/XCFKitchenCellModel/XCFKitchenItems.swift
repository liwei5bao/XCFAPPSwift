//
//  XCFKitchenItems.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenItems: NSObject {

    ///发布日期
    var publish_time:String?
    ///网页URL
    var url:String?
    ///模板
    var template:NSNumber?
    ///id
    var ID:String?
    ///模板内容
    var contents:XCFKitchenContentsModel?
    /** cellHeight */
    var cellHeight:CGFloat?
//        {
//        get{
//            if (self.template == XCFKitchenCellTemplate.Topic.rawValue || self.template == XCFKitchenCellTemplate.Recipe.rawValue) {
//                let imageH:CGFloat = CGFloat((self.contents?.image?.height?.floatValue)!)
//                let titleH:CGFloat = ((self.contents?.title)! as NSString).boundingRectWithSize(CGSizeMake(screenWidth - 45, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(CGFloat(XCFLableFontSize.Title.rawValue))], context: nil).height
//                let descHeight = ((self.contents?.desc)! as NSString).boundingRectWithSize(CGSizeMake(screenWidth - 45, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(CGFloat(XCFLableFontSize.Title.rawValue))], context: nil).height
//                return imageH + XCFRecipeCellMarginTitle + titleH + XCFRecipeCellMarginTitle2Desc + descHeight + XCFRecipeCellMarginTitle2Desc
//            }else{
//                return CGFloat((self.contents?.image?.height?.floatValue)!)
//            }
//        }
//    }


    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
}
