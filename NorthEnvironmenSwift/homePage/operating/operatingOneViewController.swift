//
//  operatingOneViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire

class operatingOneViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    var url = ""
    
    func listView() -> UIView {
        return self.view
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        /// 修改原生tabbar
        func httpService() -> Void {
            
    //       let param = ["username":"" as AnyObject,
    //
    //                    "password":"" as AnyObject,]

            //        print("\(param)")
            
           let token = UserDefaults.string(forKey: .token)
            
           let headers:HTTPHeaders = [
                    "X-AUTH-TOKEN" : token!,
                ]
            
//            print("======\(BERKKURL.Url_Sever + url)")
            
            BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + BERKKURL.URL_OperatingList, parameters: nil, headers: headers, successed: { (error, response) in
                
                if error == nil , let data = response{
                    print("==============\(data))")
                 let model = data.jsonDataMapModel(t_success_data<t_company_data>.self)
                    
                    print("==============\(String(describing: model?.data))")
    //
                    guard let content:String = model?.data?[0].content! else {
                        return
                    }
    //                self.textView.textColor = .white
    //                let codeStr =  "https://www.baidu.com/h5/rulesPage/erh5/shareErScore.html?" + "你好"
                    
                    self.textView.attributedText = NSMutableAttributedString(string: (content.htmlToString))
                         
                }
                
            }) { (error, nil) in
                SVProgressHUD.showError(withStatus: "\(String(describing: error))")
                SVProgressHUD.dismiss(withDelay: 1)
                print("======\(String(describing: error))")
            }
            
        }

}
