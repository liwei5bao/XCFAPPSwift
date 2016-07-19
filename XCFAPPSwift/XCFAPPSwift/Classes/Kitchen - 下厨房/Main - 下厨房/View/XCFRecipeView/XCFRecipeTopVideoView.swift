//
//  XCFRecipeTopVideoView.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFRecipeTopVideoView: UIView {
    
    //顶部的图片
    lazy var imageView:UIImageView = {
        let imageV = UIImageView()
        return imageV
    }()
    
    //播放视频的按钮
    lazy var videoBtn:UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubView()
    }
    
    private func setupSubView(){
        self.addSubview(imageView)
        self.backgroundColor = UIColor.blueColor()
        videoBtn.setImage(UIImage.init(named: "playButton"), forState: UIControlState.Normal)
        self.addSubview(videoBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: self.height)
        videoBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        videoBtn.center = CGPoint.init(x: screenWidth * 0.5, y: self.imageView.height * 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
