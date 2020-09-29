//
//  loginViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class loginViewController: AnalyticsViewController {

    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var userPassText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func loginAction(_ sender: Any) {
        
        
        
       let param = ["username":userText.text as AnyObject,
                
                     "password":userPassText.text as AnyObject,]
        
        
        print("\(param)")
        
        BKHttpTool.requestData(requestType: .Post, URLString: BERKKURL.URL_Login, parameters: nil, successed: { (error , response) in
            
            if error == nil , let data = response{
                
                 let model = data.jsonDataMapModel(t_success_Login<t_LoginInfo_data>.self)
                
                UserDefaults.set(value: model?.attributes?.token ?? "", forKey: UserDefaults.LoginInfo.token)
                UserDefaults.set(value: model?.attributes?.userNm ?? "", forKey: UserDefaults.LoginInfo.userNm)
                UserDefaults.set(value: model?.attributes?.phn ?? "", forKey: UserDefaults.LoginInfo.phn)

//                //登录成功
//                if result?.code == 1 {
                
                    SVProgressHUD.show(withStatus: "登录成功")
                    SVProgressHUD.dismiss(withDelay: 0.75)
                
                    let vc = RootTabBarViewController()
                    self.view.window?.rootViewController = vc
                    self.view.window?.backgroundColor = .white
                    self.view.window?.makeKeyAndVisible()
                
//                }else{//登录失败
//                    SVProgressHUD.showError(withStatus: "登录失败：\(String(describing: result?.msg))")
//                    SVProgressHUD.dismiss(withDelay: 1.75)
//                }
                
            }
            
            
            
        }) { (error, nil) in
    
            SVProgressHUD.showError(withStatus: "\(String(describing: error))")
            SVProgressHUD.dismiss(withDelay: 0.75)
        }
        
    }
}
