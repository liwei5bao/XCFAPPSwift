//
//  XCFSearchBar.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFSearchBar: UISearchBar,UISearchBarDelegate {
    ///开始点击回调方法
    var searchBarShouldBeginEditingBlock:(()->())?
    ///正在编辑的回调方法
    var searchBarTextDidChangedBlock:(()->())?
    ///开始搜索的点击回调方法
    var searchBarDidSearchBlock:(()->())?
    
    ///设置Placeholder内容
    class func searchBarWithPlaceholder(placeholder:String)->XCFSearchBar{
        let searchBar = XCFSearchBar()
        searchBar.delegate = searchBar
        searchBar.tintColor = XCFSearchBarTintColor
        searchBar.placeholder = placeholder
        searchBar.setImage(UIImage.init(named: "searchIcon"), forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Normal)
        
        let searchBarSub = searchBar.subviews[0]
        for subView in searchBarSub.subviews {
            if (subView.isKindOfClass(NSClassFromString("UISearchBarTextField")!)) {
                subView.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 240/255.0, alpha: 1)
            }
            
            if (subView.isKindOfClass(NSClassFromString("UISearchBarBackground")!)) {
                subView.removeFromSuperview()
            }
        }
        return searchBar
    }
    
    ///MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        if ((self.searchBarShouldBeginEditingBlock) != nil) {
            self.searchBarShouldBeginEditingBlock!()
        }
        return true
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if ((self.searchBarTextDidChangedBlock) != nil) {
            self.searchBarTextDidChangedBlock!()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if ((self.searchBarDidSearchBlock) != nil) {
            self.searchBarDidSearchBlock!()
        }
    }
}
