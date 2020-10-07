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
                
                let content = json["data"][0]["content"].stringValue
                
                self.textView.attributedText = content.htmlToAttributedString
                     
            }
            
        }) { (error, nil) in
            SVProgressHUD.showError(withStatus: "\(String(describing: error))")
            SVProgressHUD.dismiss(withDelay: 1)
            print("======\(String(describing: error))")
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
        
