//
//  XCFKitchenHeaderScrollowView.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/13.
//  Copyright © 2016年 liwei. All rights reserved.
//  早餐中餐午餐滚动视图

import UIKit

class XCFKitchenHeaderScrollowView: UIView ,UIScrollViewDelegate{

    var pageModel:XCFKitchenPopEventsModel?
    ///图片的点击方法
    var imageViewClick:((index:Int)->())?
    let pageScrolloView = UIScrollView()
    let pageControl = UIPageControl()
    
    let imageViewH:CGFloat = 80 * scaleSize
    convenience init(frame: CGRect,pageModel:XCFKitchenPopEventsModel,click:((index:Int)->())) {
        self.init(frame: frame)
        self.imageViewClick = click
        self.pageModel = pageModel
        self.setupPageSubViews(pageModel)
    }
    
    ///初始化子视图
    func setupPageSubViews(pageModel:XCFKitchenPopEventsModel){
        if (pageModel.events != nil) {
            //添加滚动视图
            pageScrolloView.frame = self.bounds
            pageScrolloView.pagingEnabled = true
            pageScrolloView.delegate = self
            pageScrolloView.showsHorizontalScrollIndicator = false
            self.addSubview(pageScrolloView)
            print(pageModel.events!.count)
            //添加子控件
            weak var wself = self
            for i in 0..<pageModel.events!.count{
                let imagePageVX = CGFloat(i) * screenWidth
                let imagePageVY:CGFloat = 0
                let imagePageVW:CGFloat = screenWidth
                let imagePageVH:CGFloat = self.height
               
                let imagePageV = XCFKitchenScrollowDetailV.init(frame: CGRect.init(x: imagePageVX, y: imagePageVY, width: imagePageVW, height: imagePageVH), pageModel: pageModel.events![i] as! XCFKitchenPopEventModel, click: { (index) in
                    wself!.imageViewClick!(index: index)
                })
                imagePageV.tag = i
                imagePageV.userInteractionEnabled = true
                let tap = UITapGestureRecognizer.init(target: self, action: #selector(XCFKitchenHeaderScrollowView.tapClick(_:)))
                imagePageV.addGestureRecognizer(tap)
                pageScrolloView.addSubview(imagePageV)
            }
            //设置滚动范围
            pageScrolloView.contentSize = CGSize.init(width: screenWidth * CGFloat(pageModel.events!.count), height: imageViewH)
            //添加pageControl
            pageControl.numberOfPages = (pageModel.events?.count)!
            pageControl.hidesForSinglePage = true
            pageControl.userInteractionEnabled = false
            pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
            pageControl.currentPageIndicatorTintColor = XCFTabBarSelectColor
            pageControl.center = CGPoint.init(x: screenWidth * 0.5, y: imageViewH - 10)
            self.addSubview(pageControl)
        }
    }
    
    //MARK:按钮的点击
    func tapClick(tap:UITapGestureRecognizer){
        if (self.imageViewClick != nil) {
            self.imageViewClick!(index: (tap.view?.tag)!)
        }
    }
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = ((scrollView.contentOffset.x + 0.5 * scrollView.frame.size.width)/scrollView.frame.size.width)
        let pageNuber = NSString(format: "%f",page).integerValue
        self.pageControl.currentPage = pageNuber
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:创建滚动视图里边的子视图
extension XCFKitchenHeaderScrollowView{

}