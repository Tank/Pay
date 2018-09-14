//
//  ViewController.swift
//  Pay
//
//  Created by frog2020@126.com on 09/13/2018.
//  Copyright (c) 2018 frog2020@126.com. All rights reserved.
//

import UIKit
import Pay

class ViewController: UIViewController, AuthRequestDelegate, PayRequestDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func wechatAuth(_ sender: Any) {
        if !PaySDK.instance.isInstalled() {
            print("请先安装微信客户端！")
            return
        }
        
        PaySDK.instance.authDelegate = self
        PaySDK.instance.sendAuthRequest()
    }
    
    @IBAction func wechatPayAction(_ sender: Any) {
        PaySDK.instance.signUrl = "https://wxpay.wxutil.com/pub_v2/app/app_pay.php?plat=ios"
        // PaySDK.instance.signUrl = "http://api.asc.ad2o.com/trade/pay/getSign"
        PaySDK.instance.payDelegate = self
        PaySDK.instance.getWechatPaySign(totalAmount: 0.01, subject: "支付测试", body: "支付测试")
    }
    
    @IBAction func alipayPayAction(_ sender: Any) {
        PaySDK.instance.signUrl = "http://api.asc.ad2o.com/trade/pay/getSign"
        PaySDK.instance.payDelegate = self
        PaySDK.instance.getAlipayPaySign(totalAmount: 0.01, subject: "支付测试", body: "支付测试")
    }
    
    //- MARK: authRequestDelegate
    func authRequestError(error: String) {
        print("auth error")
    }
    
    func authRequestSuccess(code: String) {
        // 拿到授权code，通过后台登录微信
        print(code)
    }
    
    //- MARK: payRequestDelegate
    func wechatPaySign(data: NSDictionary) {
        PaySDK.instance.wechatPayRequest(signData: data)
    }
    
    func alipayPaySign(str: String) {
        PaySDK.instance.alipayPayRequest(sign: str)
    }
    
    func payRequestSuccess(data: Any) {
        
    }
    
    func payRequestError(error: String) {
        print("pay error")
    }
}

