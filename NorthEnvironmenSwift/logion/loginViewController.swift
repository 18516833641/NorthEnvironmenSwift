//
//  loginViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class loginViewController: AnalyticsViewController {

    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var userPassText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.userText.attributedPlaceholder = NSAttributedString.init(string:"请输入用户名", attributes: [
            NSAttributedString.Key.foregroundColor:UIColor.white])
        
        self.userPassText.attributedPlaceholder = NSAttributedString.init(string:"请输入用户密码", attributes: [
        NSAttributedString.Key.foregroundColor:UIColor.white])
        
        
//        userText.text = "bk"
//        userPassText.text = "123456"
    }

    @IBAction func loginAction(_ sender: Any) {
        
        if userText.text!.isEmpty {

            SVProgressHUD.showError(withStatus: "请输入用户名")
            SVProgressHUD.dismiss(withDelay: 0.75)
            return
        }

        if userPassText.text!.isEmpty {

            SVProgressHUD.showError(withStatus: "请输入密码")
            SVProgressHUD.dismiss(withDelay: 0.75)
            return
        }
        
//       let param = ["username":userText.text as AnyObject,
//
//                     "password":userPassText.text as AnyObject,]
        
        guard let user = userText.text,user.count > 1  else {
                   
                       return
                   }
        
        guard let pass = userPassText.text,pass.count > 1  else {
                   
                       return
                   }
        
//        print("\(param)")
        
        
//        bkUserController?username=inter&password=123456
        
        BKHttpTool.requestData(requestType: .Post, URLString: BERKKURL.URL_Login + user + "&password=" + pass, parameters: nil, successed: { (error , response) in
            
            if error == nil , let data = response{
                
                print("====\(JSON(data))")
                
                 let model = data.jsonDataMapModel(t_success_Login<t_LoginInfo_data>.self)
                
                UserDefaults.set(value: model?.attributes?.token ?? "", forKey: UserDefaults.LoginInfo.token)
                UserDefaults.set(value: model?.attributes?.userNm ?? "", forKey: UserDefaults.LoginInfo.userNm)
                UserDefaults.set(value: model?.attributes?.phn ?? "", forKey: UserDefaults.LoginInfo.phn)
                UserDefaults.set(value: model?.attributes?.id ?? "", forKey: UserDefaults.LoginInfo.id)

                
                self.updataDeviceId()
                
//                //登录成功
//                if result?.code == 1 {
    
                    SVProgressHUD.show(withStatus: "登录成功")
                    SVProgressHUD.dismiss(withDelay: 0.75)
                
                    let vc = RootTabBarViewController()
                    self.view.window?.rootViewController = vc
                    self.view.window?.backgroundColor = .white
                    self.view.window?.makeKeyAndVisible()
                
            }
            
            
            
        }) { (error, nil) in
    
            SVProgressHUD.showError(withStatus: "\(String(describing: error))")
            SVProgressHUD.dismiss(withDelay: 0.75)
        }
        
    }
    
    
    func updataDeviceId() {
                
        let token = UserDefaults.string(forKey: .token)
         
        let headers:HTTPHeaders = [
                 "X-AUTH-TOKEN" : token!,
             ]
        let devid = UserDefaults.string(forKey: .deviceId) ?? ""

        BKHttpTool.requestData(requestType: .Put, URLString: BERKKURL.Url_Sever + BERKKURL.URL_deviceId + devid, parameters: nil, headers: headers, successed: { (error , response) in
            
            if error == nil , let data = response{
                
                let json = JSON(data)
                
                print("==============\(json)")
               
            }

            
        }) { (error, nil) in

            SVProgressHUD.showError(withStatus: "设备id获取失败")
            SVProgressHUD.dismiss(withDelay: 0.75)
                   
        }
    }
}
