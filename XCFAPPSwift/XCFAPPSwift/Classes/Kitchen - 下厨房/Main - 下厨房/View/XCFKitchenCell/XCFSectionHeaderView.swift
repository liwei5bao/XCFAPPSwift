//
//  XCFSectionHeaderView.swift
//  XCFAPPSwift
//
//  Created by liwei on 16/7/16.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFSectionHeaderView: UITableViewHeaderFooterView {
    var dateText:UILabel?
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setUpSubView()
    }
    
    private func setUpSubView(){
        let lable = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 40))
        lable.backgroundColor = UIColor.colorWithHexString(XCFCellMarginColor)
        lable.font = UIFont.systemFontOfSize(12)
        lable.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(lable)
        self.dateText = lable
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
