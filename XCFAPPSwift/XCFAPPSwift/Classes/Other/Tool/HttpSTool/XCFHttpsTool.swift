//
//  XCFHttpsTool.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/8.
//  Copyright © 2016年 liwei. All rights reserved.
//  网络工具类

import UIKit
import Alamofire
import SwiftyJSON

///请求错误不同类型分类,看公司
public enum HTTPRequestError:ErrorType{
    case None
    case SystemError(error: NSError?)
    case NetworkError
    case BusinessError(description: String)
}

///网络请求类型
public enum Method:String{
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
    var alamofireMethod:Alamofire.Method{
    var results = Alamofire.Method.GET
        switch self {
        case .GET:
            results = Alamofire.Method.GET
        case .POST:
            results = Alamofire.Method.POST
        case .HEAD:
            results = Alamofire.Method.HEAD
        case .OPTIONS:
            results = Alamofire.Method.OPTIONS
        case .PATCH:
            results = Alamofire.Method.PATCH
        case .DELETE:
            results = Alamofire.Method.DELETE
        case .TRACE:
            results = Alamofire.Method.TRACE
        case .CONNECT:
            results = Alamofire.Method.CONNECT
        case .PUT:
            results = Alamofire.Method.PUT
        }
    return results
    }
}

//
public typealias HTTPRequestHandler = (responseObject: AnyObject?, error: HTTPRequestError?) -> Void
public typealias HTTPRequestJSONHandler = (responseObject: JSON?, error: HTTPRequestError?) -> Void

class XCFHttpsTool: NSObject {
    class func dataRequest(method m: Method, urlString url: URLStringConvertible, parameter param: [String : AnyObject]?, complectionHandler: HTTPRequestHandler?) -> Request{
        
        let req = Alamofire.request(m.alamofireMethod, url, parameters: param, encoding: .URL, headers: nil)
        req.responseJSON { (resp) -> Void in
            if resp.result.isSuccess {
                if let handler = complectionHandler {
                    handler(responseObject: resp.result.value, error: nil)
                }
            } else {
                if let handler = complectionHandler {
                    handler(responseObject: nil, error: HTTPRequestError.SystemError(error: resp.result.error))
                }
            }
        }
        return req
    }
}
