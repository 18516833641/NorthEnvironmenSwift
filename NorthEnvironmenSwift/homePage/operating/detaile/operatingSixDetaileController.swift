//
//  operatingSixDetaileController.swift
//  NorthEnvironmenSwift
//
//  Created by Mac on 2020/10/7.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class operatingSixDetaileController: AnalyticsViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var titleArr:[String] = []
    var contentArr:[String] = []
    
    var url = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        httpService()
        
        titleArr = ["脱硫入口烟气O₂浓度","脱硫入口烟气SO₂浓度","脱硫入口烟气NOx浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO₂浓度","脱硫塔压差","除尘器压差","本小时出口SO₂小时均值","上一小时出口SO₂小时均值","上一小时入口SO₂小时均值","脱硫塔入口温度","脱硫塔出口温度","脱硫塔入口压力","脱硫塔出口压力","1#喷射器进口压力","2#喷射器进口压力","3#喷射器进口压力","脱硫剂喷射器进口压力","原料仓重量","脱硫塔入口温度","脱硫塔出口温度","脱硫塔入口压力","脱硫塔出口压力","1#喷射器进口压力","2#喷射器进口压力","3#喷射器进口压力","进水流量计","1#加湿机加水流量","2#加湿机加水流量","工艺水箱液位","除尘器出口温度","除尘器出口压力","1#加湿机压力","2#加湿机压力","副产物仓重量","高压变频器电流反馈","高压变频器频率反馈","高压变频器变频运行指示","高压变频器工频运行指示","高压变频器远程指示","高压变频器系统就绪指示","高压变频器运行指示","高压变频器变频报警","高压变频器变频故障","主引风机轴承温度1","主引风机轴承温度2","主引风机冷却水压力","主引风机风门执行器开度","主引风机电机轴承温度1","主引风机电机轴承温度2","储罐氮气主管压力","喷吹主管压力","空气流量计","氮气流量计"]
        
        tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
        
        
    }
    
    
    func httpService() {
            
           let token = UserDefaults.string(forKey: .token)
            
           let headers:HTTPHeaders = [
                    "X-AUTH-TOKEN" : token!,
                ]
     print("========\(BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url)")
            BKHttpTool.requestData(requestType: .Put, URLString: BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url, parameters: nil, headers: headers, successed: { (error, response) in
                
                if error == nil , let data = response{
                    
                let json = JSON(data)
                 
                 print("=====\(json)")
                    
                    if self.url == "?itmeid=1" {
                        
                        self.contentArr.append(contentsOf:
                        [json["data"]["TJRC04_01"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_47"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_48"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_49"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_50"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_51"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_52"].stringValue,
                        json["data"]["TJRC04_53"].stringValue,
                        json["data"]["TJRC04_54"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_55"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_56"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        
                        json["data"]["TJRC04_02"].stringValue,
                        json["data"]["TJRC04_03"].stringValue,
                        json["data"]["TJRC04_04"].stringValue,
                        json["data"]["TJRC04_05"].stringValue,
                        json["data"]["TJRC04_06"].stringValue,
                        json["data"]["TJRC04_07"].stringValue,
                        json["data"]["TJRC04_08"].stringValue,
                        
                        json["data"]["TJRC04_09"].stringValue,
                        json["data"]["TJRC04_10"].stringValue,
                        json["data"]["TJRC04_11"].stringValue,
                        json["data"]["TJRC04_12"].stringValue,
                        
                        json["data"]["TJRC04_13"].stringValue,
                        json["data"]["TJRC04_14"].stringValue,
                        json["data"]["TJRC04_15"].stringValue,
                        json["data"]["TJRC04_16"].stringValue,
                        json["data"]["TJRC04_17"].stringValue,
                        json["data"]["TJRC04_18"].stringValue,
                        json["data"]["TJRC04_19"].stringValue,
                        json["data"]["TJRC04_20"].stringValue,
                        json["data"]["TJRC04_21"].stringValue,
                        json["data"]["TJRC04_22"].stringValue,
                        json["data"]["TJRC04_23"].stringValue,
                        json["data"]["TJRC04_24"].stringValue,
                        json["data"]["TJRC04_25"].stringValue,
                        json["data"]["TJRC04_26"].stringValue,
                        json["data"]["TJRC04_27"].stringValue,
                        
                        json["data"]["TJRC04_28"].stringValue,
                        json["data"]["TJRC04_29"].stringValue,
                        
                        json["data"]["TJRC04_30"].stringValue,
                        
                        json["data"]["TJRC04_31"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_32"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_33"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_34"].stringValue,
                        
                        json["data"]["TJRC04_35"].stringValue,
                        json["data"]["TJRC04_36"].stringValue,
                        json["data"]["TJRC04_37"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        json["data"]["TJRC04_38"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                        
                        json["data"]["TJRC04_39"].stringValue,
                        json["data"]["TJRC04_40"].stringValue,
                        json["data"]["TJRC04_41"].stringValue,
                        json["data"]["TJRC04_42"].stringValue,
                        json["data"]["TJRC04_43"].stringValue,
                        json["data"]["TJRC04_44"].stringValue,
                        json["data"]["TJRC04_45"].stringValue,
                        json["data"]["TJRC04_46"].stringValue,
                        
                        
                        ])
                        
                    }else{
                        
                        self.contentArr.append(contentsOf:
                        [
                            json["data"]["TJRC05_01"].stringValue,
                            json["data"]["TJRC05_47"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_48"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_49"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_50"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_51"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_52"].stringValue,
                            json["data"]["TJRC05_53"].stringValue,
                            json["data"]["TJRC05_54"].stringValue,
                            json["data"]["TJRC05_55"].stringValue,
                            json["data"]["TJRC05_56"].stringValue,
                            
                            json["data"]["TJRC05_02"].stringValue,
                            json["data"]["TJRC05_03"].stringValue,
                            json["data"]["TJRC05_04"].stringValue,
                            json["data"]["TJRC05_05"].stringValue,
                            json["data"]["TJRC05_06"].stringValue,
                            json["data"]["TJRC05_07"].stringValue,
                            json["data"]["TJRC05_08"].stringValue,
                            
                            json["data"]["TJRC05_09"].stringValue,
                            json["data"]["TJRC05_10"].stringValue,
                            json["data"]["TJRC05_11"].stringValue,
                            json["data"]["TJRC05_12"].stringValue,
                            
                            json["data"]["TJRC05_13"].stringValue,
                            json["data"]["TJRC05_14"].stringValue,
                            json["data"]["TJRC05_15"].stringValue,
                            json["data"]["TJRC05_16"].stringValue,
                            json["data"]["TJRC05_17"].stringValue,
                            json["data"]["TJRC05_18"].stringValue,
                            json["data"]["TJRC05_19"].stringValue,
                            json["data"]["TJRC05_20"].stringValue,
                            json["data"]["TJRC05_21"].stringValue,
                            json["data"]["TJRC05_22"].stringValue,
                            json["data"]["TJRC05_23"].stringValue,
                            json["data"]["TJRC05_24"].stringValue,
                            json["data"]["TJRC05_25"].stringValue,
                            json["data"]["TJRC05_26"].stringValue,
                            json["data"]["TJRC05_27"].stringValue,
                            
                            json["data"]["TJRC05_28"].stringValue,
                            json["data"]["TJRC05_29"].stringValue,
                            
                            json["data"]["TJRC05_30"].stringValue,
                            
                            json["data"]["TJRC05_31"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_32"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_33"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_34"].stringValue,
                            
                            json["data"]["TJRC05_35"].stringValue,
                            json["data"]["TJRC05_36"].stringValue,
                            json["data"]["TJRC05_37"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            json["data"]["TJRC05_38"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                            
                            json["data"]["TJRC05_39"].stringValue,
                            json["data"]["TJRC05_40"].stringValue,
                            json["data"]["TJRC05_41"].stringValue,
                            json["data"]["TJRC05_42"].stringValue,
                            json["data"]["TJRC05_43"].stringValue,
                            json["data"]["TJRC05_44"].stringValue,
                            json["data"]["TJRC05_45"].stringValue,
                            json["data"]["TJRC05_46"].stringValue
                        ])
                        
                    }
                    
                    


                print("======\(self.contentArr)")
                self.tableView.reloadData()
                     
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


extension operatingSixDetaileController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:operatingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "operatingTableViewCell") as? operatingTableViewCell else {
            let cells = operatingTableViewCell(style: .default, reuseIdentifier: "operatingTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        
        
        cell.titleLabel.text = titleArr[indexPath.row]
        
        if contentArr.count > 0 {
            cell.contenLabel.text = contentArr[indexPath.row]
        }
        
        
        
        return cell
        
    }
   
}
