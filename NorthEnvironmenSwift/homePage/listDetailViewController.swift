//
//  listDetailViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class listDetailViewController: AnalyticsViewController {
    
    var url = ""
    
    var project = "0"
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.isEditable = false
        httpService()
    }
    
    /// 修改原生tabbar
    func httpService() {
        
//       let param = ["username":"" as AnyObject,
//
//                    "password":"" as AnyObject,]

        //        print("\(param)")
        
       let token = UserDefaults.string(forKey: .token)
        
       let headers:HTTPHeaders = [
                "X-AUTH-TOKEN" : token!,
            ]
        
//        print("======\(headers)")
        
        print("======\(BERKKURL.Url_Sever + url)")
        
        BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + url, parameters: nil, headers: headers, successed: { (error, response) in
            
            if error == nil , let data = response{
                
                let json = JSON(data)
                
                print("\(json)")
                
                if self.project == "1" {
                    let content = json["data"][0]["content"].stringValue
                    self.textView.attributedText = content.htmlToAttributedString
                }else{
                    let content = json["data"]["content"].stringValue
                    self.textView.attributedText = content.htmlToAttributedString
                }
                
                
                
//                let str:NSString = "<html><meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\"/><head><style type=\"text/css\">body{font-size:18px;}</style></head><body>%@<style>*{ width: %fpx; margin: 0; padding: 0 0; box-sizing: border-box;} img{ width: %fpx;}</style></body></html>" as NSString;
//
//                               content = NSString(format: str,content,width,width)
                
                
                     
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

extension String {
        var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
        
