//
//  operatingFourDetaileController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/27.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class operatingFourDetaileController: AnalyticsViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var nameArr = ["故障中","已解除"]
    var rightArr = ["2020-06-09","2020-07-09"]
    var imageArr = ["gzz","yjc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        httpService()
        
        tableView.register(UINib(nibName: "operatingFourDetaileTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingFourDetaileTableViewCell")
    }
    
    
    func httpService() -> Void {
                
               let token = UserDefaults.string(forKey: .token)
                
               let headers:HTTPHeaders = [
                        "X-AUTH-TOKEN" : token!,
                    ]
        
        print("\(BERKKURL.Url_Sever + BERKKURL.URL_GZtingk + "/1&0")")
                BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + BERKKURL.URL_GZtingk + "/1&0", parameters: nil, headers: headers, successed: { (error, response) in
                    
                    if error == nil , let data = response{
                        
                    let json = JSON(data)
                    
                        print("----\(json["data"])")
                    
//                        var jsonArr = self.getArrayFromJSONString(jsonString: json["data"])
//                        
//                        print("\(jsonArr)")

                        self.tableView.reloadData()
//                        print("-------------------------\(self.contentArr)")
    //                let content = json["data"]["content"].stringValue
    //                self.textView.attributedText = NSMutableAttributedString(string: (content.htmlToString))
                         
                    }
                    
                }) { (error, nil) in
                    SVProgressHUD.showError(withStatus: "\(String(describing: error))")
                    SVProgressHUD.dismiss(withDelay: 1)
                    print("======\(String(describing: error))")
                }
                
        }
    
    func getArrayFromJSONString(jsonString:String) ->NSArray{
         
        let jsonData:Data = jsonString.data(using: .utf8)!
         
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return array as! NSArray
         
    }
}


extension operatingFourDetaileController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:operatingFourDetaileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "operatingFourDetaileTableViewCell") as? operatingFourDetaileTableViewCell else {
            let cells = operatingFourDetaileTableViewCell(style: .default, reuseIdentifier: "operatingFourDetaileTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
//        cell.rightLabel.isHidden = false
//        cell.headIcon.image = UIImage.init(named: imageArr[indexPath.item])
//        cell.titleLabel.text = nameArr[indexPath.row]
//        cell.rightLabel.text = rightArr[indexPath.row]
        
        
        return cell
        
    }
   
}
