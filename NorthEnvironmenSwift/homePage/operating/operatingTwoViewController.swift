//
//  operatingTwoViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class operatingTwoViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
    
    var url = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    let titleArr = ["脱硫入口烟气O₂浓度","脱硫入口烟气SO₂浓度","脱硫入口烟气NOx浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO₂浓度","脱硫塔压差","除尘器压差","本小时出口SO₂小时均值","上一小时出口SO₂小时均值","上一小时入口SO₂小时均值"]
    var contentArr = ["脱硫入口烟气O₂浓度","脱硫入口烟气SO₂浓度","脱脱硫入口烟气NOx浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO₂浓度","脱硫塔压差","除尘器压差","本小时出口SO₂小时均值","上一小时出口SO₂小时均值","上一小时入口SO₂小时均值"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        httpService()
        
         tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
        
    }


    //烟气系统
    @IBAction func yanqiAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "烟气系统"
        vc.type = .one
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //原料系统
    @IBAction func yuanliaoAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "原料系统"
        vc.type = .two
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //脱硫系统
    @IBAction func tuoliuAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "脱硫系统"
        vc.type = .three
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //水系统
    @IBAction func shuiAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "水系统"
        vc.type = .four
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //除尘系统
    @IBAction func chuchengAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "除尘系统"
        vc.type = .five
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //副产物系统
    @IBAction func fuchanwuAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "副产物系统"
        vc.type = .six
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //风机系统
    @IBAction func fengjiAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "风机系统"
        vc.type = .seven
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //projectType
    @IBAction func qiAction(_ sender: Any) {
        let vc = operatingTwoDetaileController()
        vc.title = "气系统"
        vc.type = .eight
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    func httpService() {
            
           let token = UserDefaults.string(forKey: .token)
            
           let headers:HTTPHeaders = [
                    "X-AUTH-TOKEN" : token!,
                ]
            BKHttpTool.requestData(requestType: .Put, URLString: BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url, parameters: nil, headers: headers, successed: { (error, response) in
                
                if error == nil , let data = response{
                    
                let json = JSON(data)
                    print(json)
//                    if indexPath.row == 0 {
//                        vc.project = "?itmeid=1"
//                    }else{
//                        vc.project = "?itmeid=2"
//                    }
                    if self.url == "?itmeid=1" {
                        
                        self.contentArr = [json["data"]["TJRC04_01"].stringValue,
                                       json["data"]["TJRC04_47"].stringValue,
                                       json["data"]["TJRC04_48"].stringValue,
                                       json["data"]["TJRC04_49"].stringValue,
                                       json["data"]["TJRC04_50"].stringValue,
                                       json["data"]["TJRC04_51"].stringValue,
                                       json["data"]["TJRC04_52"].stringValue,
                                       json["data"]["TJRC04_53"].stringValue,
                                       json["data"]["TJRC04_54"].stringValue,
                                       json["data"]["TJRC04_55"].stringValue,
                                       json["data"]["TJRC04_56"].stringValue,
                        ]
                        
                    }else{
                        
                        self.contentArr = [json["data"]["TJRC05_01"].stringValue,
                                       json["data"]["TJRC05_47"].stringValue,
                                       json["data"]["TJRC05_48"].stringValue,
                                       json["data"]["TJRC05_49"].stringValue,
                                       json["data"]["TJRC05_50"].stringValue,
                                       json["data"]["TJRC05_51"].stringValue,
                                       json["data"]["TJRC05_52"].stringValue,
                                       json["data"]["TJRC05_53"].stringValue,
                                       json["data"]["TJRC05_54"].stringValue,
                                       json["data"]["TJRC05_55"].stringValue,
                                       json["data"]["TJRC05_56"].stringValue,
                        ]
                        
                    }
                
                

                    self.tableView.reloadData()
                    print("-------------------------\(self.contentArr)")
                     
                }
                
            }) { (error, nil) in
                SVProgressHUD.showError(withStatus: "\(String(describing: error))")
                SVProgressHUD.dismiss(withDelay: 1)
                print("======\(String(describing: error))")
            }
            
    }
}


extension operatingTwoViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:operatingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "operatingTableViewCell") as? operatingTableViewCell else {
            let cells = operatingTableViewCell(style: .default, reuseIdentifier: "operatingTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        
         
         cell.titleLabel.text = titleArr[indexPath.row]
         cell.contenLabel.text = contentArr[indexPath.row]
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = operatingThreeDetaileController()
        vc.title = "折线图详情页"
        self.navigationController?.pushViewController(vc, animated: true)
        
        //总系统
        let titleArr = ["TJRC04_01","TJRC04_47","TJRC04_48","TJRC04_49","TJRC04_50","TJRC04_51","TJRC04_52","TJRC04_53","TJRC04_54","TJRC04_55","TJRC04_56"]
        vc.projrctStr = titleArr[indexPath.row]

        
    }
   
}

