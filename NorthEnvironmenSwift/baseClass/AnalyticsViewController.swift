//
//  AnalyticsViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class AnalyticsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor = UIColor(red: 26/255.0, green: 35/255.0, blue: 49/255.0, alpha: 1)
        
       let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self,action:#selector(backAction))
                      
       leftBarBtn.image = UIImage(named: "fh_icon")

       self.navigationItem.leftBarButtonItem = leftBarBtn
       self.navigationItem.leftBarButtonItem?.tintColor = UIColor.init(red: 19/255.0, green: 134/255.0, blue: 139/255.0, alpha: 1)
        
        
        // Do any additional setup after loading the view.
    }
    
    //返回按钮点击响应
    @objc func backAction(){
        self.navigationController!.popViewController(animated: true)
    }

  
    //MARK:适配iphonex
    func isiPhoneXScreen() -> Bool {
        
        let isiphoneX = UIApplication.shared.statusBarFrame.height >= 44
        return isiphoneX
    }
    
    func isiPhonePluscreen() -> Bool {
        if UIScreen.main.bounds.width >= 414 {
            return true
        }
        return false
    }
}
