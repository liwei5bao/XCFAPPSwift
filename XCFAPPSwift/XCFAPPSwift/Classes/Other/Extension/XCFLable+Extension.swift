//
//  XCFLable+Extension.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//

import Foundation

extension UILabel{
    
    //快速初始化一个lable
    class func lableWithFont(font:CGFloat,textColor:UIColor,numberOfLine:NSInteger)->UILabel{
        let lable = UILabel()
        lable.font = UIFont.systemFontOfSize(font)
        lable.textColor = textColor
        lable.numberOfLines = numberOfLine
        return lable
    }
    
    //设置lable的行间距
    func setLableSpacing(spacing:CGFloat,content:String?) {
        if (content == nil) {
            return
        }
        let attStr = NSMutableAttributedString.init(string: content!)
        let style = NSMutableParagraphStyle.init()
        attStr.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange.init(location: 0, length: (content?.characters.count)!))
        self.attributedText = attStr
    }
    
    //获取label的高度
    func getLabelHeightWithMaxWidth(width:CGFloat)-> CGFloat{
        return self.systemLayoutSizeFittingSize(CGSize.init(width: width, height: CGFloat(MAXFLOAT))).height
    }
    
    //获取一段文字的行数
    func getNumOfLineWithContent(content:String,width:CGFloat) -> NSInteger {
        self.preferredMaxLayoutWidth = width
        let rect = (content as NSString).boundingRectWithSize(CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:self.font], context: nil)
        let linCount = (NSInteger)(rect.size.height / self.font.lineHeight)
        return linCount
    }
}