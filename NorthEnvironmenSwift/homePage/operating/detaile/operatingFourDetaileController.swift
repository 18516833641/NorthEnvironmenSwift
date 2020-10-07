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
    
    var projrctStr = ""
    var typeStr = ""
    var str = ""
    
    
    var dataSource:[t_fault_data] = []
//    var nameArr:[String] = []
//    var createArr:[String] = []
//    var updateArr:[String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        httpService()
        
        tableView.register(UINib(nibName: "operatingFourDetaileTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingFourDetaileTableViewCell")
    }
    
    
    func httpService() {
                
               let token = UserDefaults.string(forKey: .token)
                
               let headers:HTTPHeaders = [
                        "X-AUTH-TOKEN" : token!,
                    ]
        
        if projrctStr == "?itmeid=1" {
            str = "1"
        }else{
            str = "2"
        }
        
//        print("\(BERKKURL.Url_Sever + BERKKURL.URL_GZtingk + "/" + projrctStr + "&" + typeStr)")?itmeid=1
                BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + BERKKURL.URL_GZtingk + "/" + str + "&" + typeStr, parameters: nil, headers: headers, successed: { (error, response) in
                    
                    if error == nil , let data = response{
                        
                        let model = data.jsonDataMapModel(t_success_data<t_fault_data>.self)

//                        print("==============\(String(describing: model))")
                        guard let dataList = model?.data,error == nil else {

//                            self.noData.image = UIImage(named: "sever_error")
//                            self.noData.isHidden = false
                            return
                        }

                        for cellData in dataList {
                           self.dataSource.append(cellData)
                       }
                         self.tableView.reloadData()
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
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:operatingFourDetaileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "operatingFourDetaileTableViewCell") as? operatingFourDetaileTableViewCell else {
            let cells = operatingFourDetaileTableViewCell(style: .default, reuseIdentifier: "operatingFourDetaileTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        let listData = dataSource[indexPath.row]
        
        cell.title1.text = "故障区域：" + (listData.itemnm ?? "")
        cell.title2.text = "故障开始日期：" + (listData.create_date ?? "")
        cell.title3.text = "故障截止日期：" + (listData.update_date ?? "")

        
        
        return cell
        
    }
   
}
