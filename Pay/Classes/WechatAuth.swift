//
//  WechatAuth.swift
//  Pay_Example
//
//  Created by Tank on 2018/9/14.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Pay

extension PaySDK {
    public func sendAuthRequest() -> Void {
        let req = SendAuthReq()
        req.scope = "snsapi_userinfo"
        req.state = state
        WXApi.send(req)
    }
}

extension PaySDK: WXApiDelegate {
    public func onResp(_ resp: BaseResp!) {
        if type(of: resp) == SendAuthReq.self {
            let authResp = resp as! SendAuthResp
            if 0 == authResp.errCode && state == authResp.state {
                authDelegate?.authRequestSuccess(code: authResp.code)
            } else {
                authDelegate?.authRequestError(error: authResp.errStr)
            }
        } else if (type(of: resp) == PayResp.self) {
            let payResp = resp as! PayResp
            if 0 == payResp.errCode {
                payDelegate?.payRequestSuccess(data: payResp.returnKey)
            } else {
                payDelegate?.payRequestError(error: payResp.errStr)
            }
        }
    }
}
