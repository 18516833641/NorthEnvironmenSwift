//
//  RootNavigationViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class RootNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 19/255.0, green: 134/255.0, blue: 139/255.0, alpha: 1)]
        
        self.navigationBar.barTintColor = UIColor(red: 32/255.0, green: 38/255.0, blue: 48/255.0, alpha: 1)
        
        self.navigationBar.isTranslucent = false
    }
    
//    //返回按钮点击响应
//     @objc func backAction(){
//         self.navigationController!.popViewController(animated: true)
//     }


}
