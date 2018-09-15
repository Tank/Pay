//
//  PayService.swift
//  Pay_Example
//
//  Created by Tank on 2018/9/13.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Pay

public protocol PayRequestDelegate {
    func wechatPaySign(data: NSDictionary) -> Void
    func alipayPaySign(str: String) -> Void
    func payRequestSuccess(data: Any) -> Void
    func payRequestError(error: String) -> Void
}

public protocol AuthRequestDelegate {
    func authRequestSuccess(code: String) -> Void
    func authRequestError(error: String) -> Void
}

public class PaySDK: NSObject {
    public static let instance: PaySDK = PaySDK()
    public var signUrl: String? = nil
    public static var alipayAppid: String? = nil

    public var authDelegate: AuthRequestDelegate?
    public var payDelegate: PayRequestDelegate?
    
    // - MARK: 微信相关设置
    var state = "8f9378894fe7d2b777ece002afb6b705"
    public static var wxAppid: String! {
        didSet {
            WXApi.registerApp(wxAppid)
        }
    }
    
    public func isInstalled() -> Bool {
        return WXApi.isWXAppInstalled()
    }
    
    public func handleOpenURL(_ url: URL) -> Bool {
        return WXApi.handleOpen(url, delegate: PaySDK.instance as! WXApiDelegate)
    }
}
