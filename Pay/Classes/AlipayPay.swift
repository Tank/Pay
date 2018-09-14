//
//  AlipayPay.swift
//  Pay_Example
//
//  Created by Tank on 2018/9/14.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Alamofire
import Pay

extension PaySDK {
    public func getAlipayPaySign(totalAmount: Float, subject: String, body: String) -> Void {
        if let signUrl = self.signUrl {
            let params: Parameters = ["totalAmount": totalAmount, "subject": subject, "body": body, "appKey": PaySDK.alipayAppid]
            Alamofire.request(signUrl, method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { response in
                switch response.result {
                case .success(let data):
                    let str = "app_id=2018071060535741&biz_content=%7B%22body%22%3A%22Test%20Test%20Test%22%2C%22subject%22%3A%22Test%22%2C%22out_trade_no%22%3A%22RSO9KAD1yPp1534329807044%22%2C%22timeout_express%22%3A%2210m%22%2C%22total_amount%22%3A%220.01%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%7D&charset=utf-8&format=JSON&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Fapi.asc.ad2o.com%2Ftrade%2Fpay%2Fnotify&sign_type=RSA2&timestamp=2018-08-15%2018%3A43%3A27&version=1.0&sign=jTH9ND%2B4ZUiI3cvHY5YTGFLxyqprd%2BPZmDlC3Me%2FQ%2FblOkLLVfWAr2dxgUOqGs9c1LsR9ssIayy6QVwLj7s0BS5j2j6%2BdhgiWHuPRfUXxtUQxSxXpVkW1yTMFhyPCWjeW8cZGbffsVOTtHS2LPflZVu5ojBsc27j1eaErD3gY7BZDGFAFZw5VdEKyAdO%2BMWxRZZlLiqVS4OtMz0mBHlfgmYPTdwCNTirMtyF22EdgVqDKAdv7wpoBRwBSfjpQTKzRjcNfoGHJnsj3jdFvblzSA9qZEzXXaAf7xiC3%2Fnc97OhsdXBETJBEIZru%2F1Horj13Uj3lkAi%2F1YuZPlyda6BNQ%3D%3D"
                    self.payDelegate?.alipayPaySign(str: str)
                case .failure(let error):
                    self.payDelegate?.payRequestError(error: error as! String)
                }
            }
        } else {
            self.payDelegate?.payRequestError(error: "签名地址不存在！")
        }
    }
    
    public func alipayPayRequest(sign: String) {
        AlipaySDK.defaultService().payOrder(sign, fromScheme: PaySDK.alipayAppid) { (result) in
            // 检查支付结果
        }
    }
}
