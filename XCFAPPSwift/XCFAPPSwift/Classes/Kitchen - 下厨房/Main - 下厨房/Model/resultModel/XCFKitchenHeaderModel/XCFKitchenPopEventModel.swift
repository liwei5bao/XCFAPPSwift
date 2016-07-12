//
//  XCFKitchenPopEventModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//  下厨房首页表头早餐午餐晚餐model

import UIKit

class XCFKitchenPopEventModel: NSObject {
    ///作品数
    var n_dishes:String?
    ///导航id
    var ID:String?
    ///导航标题
    var name:String?
    ///图片地址
    var thumbnail_280:String?
    
    override static func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id","thumbnail_280":"dishes.dishes[0].thumbnail_280"]
    }
    
    /**
     dishes =                     {
     dishes =                         (
     {
     "thumbnail_280" = "http://s2.cdn.xiachufang.com/c624fe3347f311e694c3bf4e08dac3de.jpg?imageView2/1/w/280/h/280/interlace/1/q/90/format/jpg/.jpg";
     },
     {
     "thumbnail_280" = "http://s2.cdn.xiachufang.com/e1fded9147c711e6acbf738e895df222.jpg?imageView2/1/w/280/h/280/interlace/1/q/90/format/jpg/.jpg";
     },
     {
     "thumbnail_280" = "http://s1.cdn.xiachufang.com/5bb5bc7347cf11e6ba6eadff6de789b0.jpg@2o_50sh_1pr_1l_280w_280h_1c_1e_90q_1wh.jpg";
     },
     {
     "thumbnail_280" = "http://s2.cdn.xiachufang.com/246940a647fa11e6af4b85d20a436cb9.jpg?imageView2/1/w/280/h/280/interlace/1/q/90/format/jpg/.jpg";
     },
     {
     "thumbnail_280" = "http://s2.cdn.xiachufang.com/db5f1bf047ca11e6a476adff6de789b0.jpg?imageView2/1/w/280/h/280/interlace/1/q/90/format/jpg/.jpg";
     }
     );
     };
     */
}
