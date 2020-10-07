//
//  operatingOneViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class operatingOneViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    var url = ""
    
    func listView() -> UIView {
        return self.view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false

        httpService()
    }

    func httpService() {
            
           let token = UserDefaults.string(forKey: .token)
            
           let headers:HTTPHeaders = [
                    "X-AUTH-TOKEN" : token!,
                ]
            
            BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url, parameters: nil, headers: headers, successed: { (error, response) in
                
                if error == nil , let data = response{
                    
                let json = JSON(data)

                let content = json["data"]["content"].stringValue

                self.textView.attributedText = content.htmlToAttributedString
                     
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
