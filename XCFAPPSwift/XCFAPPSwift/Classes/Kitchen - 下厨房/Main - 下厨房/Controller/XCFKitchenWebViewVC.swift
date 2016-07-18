//
//  XCFKitchenWebViewVC.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import WebKit
class XCFKitchenWebViewVC: UIViewController {
    ///懒加载一个webView
    var webView:WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    ///网络加载的url
    var url:String?{
        didSet{
            let request = NSURLRequest.init(URL: NSURL.init(string: url!)!)
            webView.loadRequest(request)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = self.view.bounds
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
