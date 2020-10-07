//
//  passWordViewController.swift
//  NorthEnvironmenSwift
//
//  Created by Mac on 2020/9/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class passWordViewController: AnalyticsViewController {

    @IBOutlet weak var oldPassWord: UITextField!
    @IBOutlet weak var newPassWord: UITextField!
    @IBOutlet weak var nextPassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.oldPassWord.attributedPlaceholder = NSAttributedString.init(string:"请输入旧密码", attributes: [
        NSAttributedString.Key.foregroundColor:UIColor.white])
        
        self.newPassWord.attributedPlaceholder = NSAttributedString.init(string:"请输入新密码", attributes: [
        NSAttributedString.Key.foregroundColor:UIColor.white])
        
        self.nextPassWord.attributedPlaceholder = NSAttributedString.init(string:"请再次输入新密码", attributes: [
        NSAttributedString.Key.foregroundColor:UIColor.white])
        
    }


    @IBAction func contenAction(_ sender: Any) {

        
        if oldPassWord.text!.isEmpty {

            SVProgressHUD.showError(withStatus: "请输入旧密码")
            SVProgressHUD.dismiss(withDelay: 0.75)
            return
        }

        if newPassWord.text!.isEmpty {

            SVProgressHUD.showError(withStatus: "请输入新密码")
            SVProgressHUD.dismiss(withDelay: 0.75)
            return
        }

        if nextPassWord.text!.isEmpty {

            SVProgressHUD.showError(withStatus: "请再次输入新密码")
            SVProgressHUD.dismiss(withDelay: 0.75)
            return
        }


        if newPassWord.text != nextPassWord.text {
            SVProgressHUD.showError(withStatus: "两次密码输入不一致")
            SVProgressHUD.dismiss(withDelay: 0.75)
            return
        }
        
         httpService()
        
    }
 
    func httpService() {
                    
            let token = UserDefaults.string(forKey: .token)

            guard let userid = UserDefaults.string(forKey: .id),userid.count > 1  else {
                
                return
            }
        
            

            guard let old = oldPassWord.text,old.count > 1  else {
            
                return
            }
        
            guard let pass = nextPassWord.text,pass.count > 1  else {
            
                return
            }


            let headers:HTTPHeaders = [
                     "X-AUTH-TOKEN" : token!,
                 ]
            BKHttpTool.requestData(requestType: .Put, URLString: BERKKURL.URL_PassWord + "userid=" + userid + "&password=" + old + "&newpassword=" + pass, parameters: nil, headers: headers, successed: { (error , response) in

                if error == nil , let data = response{

                    print("====\(JSON(data))")
                    
                    let json = JSON(data)
                    
                    
                    SVProgressHUD.showSuccess(withStatus:json["mag"].stringValue )
                    SVProgressHUD.dismiss(withDelay: 0.75)
                    
                    self.oldPassWord.text = ""
                    self.newPassWord.text = ""
                    self.nextPassWord.text = ""


                }



            }) { (error, nil) in

                SVProgressHUD.showError(withStatus: "登录已失效")
                SVProgressHUD.dismiss(withDelay: 0.75)
                let vc = loginViewController()
                self.view.window?.rootViewController = vc
                self.view.window?.backgroundColor = .white
                self.view.window?.makeKeyAndVisible()
            }
        }

}
