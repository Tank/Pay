//
//  WechatPay.swift
//  Pay_Example
//
//  Created by Tank on 2018/9/14.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Alamofire
import Pay

extension PaySDK {
    public func getWechatPaySign(totalAmount: Float, subject: String, body: String) -> Void {
        if let signUrl = self.signUrl {
            let params: Parameters = ["totalAmount": totalAmount, "subject": subject, "body": body, "appKey": PaySDK.wxAppid]
            Alamofire.request(signUrl, method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { response in
                switch response.result {
                case .success(let data):
                    self.payDelegate?.wechatPaySign(data: data as! NSDictionary)
                case .failure(let error):
                    self.payDelegate?.payRequestError(error: error as! String)
                }
            }
        } else {
            self.payDelegate?.payRequestError(error: "签名地址不存在")
        }
    }
    
    public func wechatPayRequest(signData: NSDictionary) {
        let payReq = PayReq()
        
        payReq.nonceStr = signData.object(forKey: "noncestr") as! String
        payReq.partnerId = signData.object(forKey: "partnerid") as! String
        payReq.prepayId = signData.object(forKey: "prepayid") as! String
        payReq.timeStamp = signData.object(forKey: "timestamp") as! UInt32
        payReq.package = signData.object(forKey: "package") as! String
        payReq.sign = signData.object(forKey: "sign") as! String
        WXApi.send(payReq)
    }
}
