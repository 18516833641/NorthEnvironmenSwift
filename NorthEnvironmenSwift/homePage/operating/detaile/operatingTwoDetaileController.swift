//
//  operatingTwoDetaileController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/27.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class operatingTwoDetaileController: AnalyticsViewController {

    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var type = northType.one
    
    var url = ""
    
    
    enum northType {
        case one//烟气系统
        case two//原料系统
        case three//脱硫系统
        case four//水系统
        case five//除尘系统
        case six//副产物系统
        case seven//风机系统
        case eight//气系统
    }
    
    var titleArr:[String] = []
    var contentArr:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpService()

        switch type {
        
        case .one://烟气系统
            
            backImage.image = UIImage.init(named: "yqxt_backimage")
            titleArr = ["冷风阀开度反馈","一氧化碳浓度检测1","原烟气挡板门开到位","原烟气挡板门关到位","净烟气挡板门开到位","净烟气挡板门关到位","旁路挡板门开到位","旁路挡板门关到位"]
        case .two://原料系统
            
            backImage.image = UIImage.init(named: "ylxt_backimage")
            titleArr = ["脱硫剂喷射器进口压力","原料仓重量"]
            
        case .three://脱硫系统
            
            backImage.image = UIImage.init(named: "tlxt_backimage")
            titleArr = ["脱硫塔入口温度","脱硫塔出口温度","脱硫塔入口压力","脱硫塔出口压力","1#喷射器进口压力","2#喷射器进口压力","3#喷射器进口压力"]
            
        case .four://水系统
            
            backImage.image = UIImage.init(named: "sxt_backimage")
            titleArr = ["进水流量计","1#加湿机加水流量","2#加湿机加水流量","工艺水箱液位"]
            
        case .five://除尘系统
            
            backImage.image = UIImage.init(named: "ccxt_backimage")
            titleArr = ["除尘器出口温度","除尘器出口压力","1#加湿机压力","2#加湿机压力"]
            
        case .six://副产物系统
            
            backImage.image = UIImage.init(named: "fcwxt_backimage")
            titleArr = ["副产物仓重量"]
            
        case .seven://风机系统
            
            backImage.image = UIImage.init(named: "fjxt_backimage")
            titleArr = ["高压变频器电流反馈","高压变频器频率反馈","高压变频器变频运行指示","高压变频器工频运行指示","高压变频器远程指示","高压变频器系统就绪指示","高压变频器运行指示","高压变频器变频报警","高压变频器变频故障","主引风机轴承温度1","主引风机轴承温度2","主引风机冷却水压力","主引风机风门执行器开度","主引风机电机轴承温度1","主引风机电机轴承温度2"]
            
        default://气系统
        
            backImage.image = UIImage.init(named: "qxt_backimage")
            titleArr = ["储罐氮气主管压力","喷吹主管压力","空气流量计","氮气流量计"]
        
        }
        
        
        
        
        tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
    }
    
    
    func httpService(){
               
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
                        switch self.type {
                        
                        case .one://烟气系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC04_39"].stringValue,
                                json["data"]["TJRC04_40"].stringValue,
                                json["data"]["TJRC04_41"].stringValue,
                                json["data"]["TJRC04_42"].stringValue,
                                json["data"]["TJRC04_43"].stringValue,
                                json["data"]["TJRC04_44"].stringValue,
                                json["data"]["TJRC04_45"].stringValue,
                                json["data"]["TJRC04_46"].stringValue,
                                ])
                            
                        case .two://原料系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC04_28"].stringValue,
                                json["data"]["TJRC04_29"].stringValue
                                ])
                            
                        case .three://脱硫系统
                            
                           self.contentArr.append(contentsOf:
                               [json["data"]["TJRC04_02"].stringValue,
                               json["data"]["TJRC04_03"].stringValue,
                               json["data"]["TJRC04_04"].stringValue,
                               json["data"]["TJRC04_05"].stringValue,
                               json["data"]["TJRC04_06"].stringValue,
                               json["data"]["TJRC04_07"].stringValue,
                               json["data"]["TJRC04_08"].stringValue])
                            
                        case .four://水系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC04_31"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                 json["data"]["TJRC04_32"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                 json["data"]["TJRC04_33"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                json["data"]["TJRC04_34"].stringValue,
                                ])
                            
                        case .five://除尘系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC04_09"].stringValue,
                                json["data"]["TJRC04_10"].stringValue,
                                json["data"]["TJRC04_11"].stringValue,
                                json["data"]["TJRC04_12"].stringValue,
                                ])
                            
                        case .six://副产物系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC04_30"].stringValue,
                                ])
                            
                        case .seven://风机系统
                            
                           self.contentArr.append(contentsOf:
                               [json["data"]["TJRC04_13"].stringValue,
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
                               json["data"]["TJRC04_27"].stringValue
                               ])
                            
                        default://气系统
                        
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC04_35"].stringValue,
                                json["data"]["TJRC04_36"].stringValue,
                                json["data"]["TJRC04_37"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                json["data"]["TJRC04_38"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                ])
                        
                        }
                        
                    }else{
                        
                        switch self.type {
                        
                        case .one://烟气系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC05_39"].stringValue,
                                json["data"]["TJRC05_40"].stringValue,
                                json["data"]["TJRC05_41"].stringValue,
                                json["data"]["TJRC05_42"].stringValue,
                                json["data"]["TJRC05_43"].stringValue,
                                json["data"]["TJRC05_44"].stringValue,
                                json["data"]["TJRC05_45"].stringValue,
                                json["data"]["TJRC05_46"].stringValue,
                                ])
                            
                        case .two://原料系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC05_28"].stringValue,
                                json["data"]["TJRC05_29"].stringValue
                                ])
                            
                        case .three://脱硫系统
                            
                           self.contentArr.append(contentsOf:
                               [json["data"]["TJRC05_02"].stringValue,
                               json["data"]["TJRC05_03"].stringValue,
                               json["data"]["TJRC05_04"].stringValue,
                               json["data"]["TJRC05_05"].stringValue,
                               json["data"]["TJRC05_06"].stringValue,
                               json["data"]["TJRC05_07"].stringValue,
                               json["data"]["TJRC05_08"].stringValue])
                            
                        case .four://水系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC05_31"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                 json["data"]["TJRC05_32"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                 json["data"]["TJRC05_33"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                json["data"]["TJRC05_34"].stringValue,
                                ])
                            
                        case .five://除尘系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC05_09"].stringValue,
                                json["data"]["TJRC05_10"].stringValue,
                                json["data"]["TJRC05_11"].stringValue,
                                json["data"]["TJRC05_12"].stringValue,
                                ])
                            
                        case .six://副产物系统
                            
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC05_30"].stringValue,
                                ])
                            
                        case .seven://风机系统
                            
                           self.contentArr.append(contentsOf:
                               [json["data"]["TJRC05_13"].stringValue,
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
                               json["data"]["TJRC05_27"].stringValue
                               ])
                            
                        default://气系统
                        
                            self.contentArr.append(contentsOf:
                                [json["data"]["TJRC05_35"].stringValue,
                                json["data"]["TJRC05_36"].stringValue,
                                json["data"]["TJRC05_37"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                json["data"]["TJRC05_38"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                ])
                        
                        }
                        
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



extension operatingTwoDetaileController:UITableViewDelegate,UITableViewDataSource{
    
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
        
        
        if contentArr.count > 0 {
            switch type {
                    case .one:
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    case .two:
                        
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    case .three:
                        
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    case .four:
                        
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    case .five:
                        
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    case .six:
                        
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    case .seven:
                       
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
                        
                    default:
                        cell.titleLabel.text = titleArr[indexPath.row]
                        cell.contenLabel.text = contentArr[indexPath.row]
            //            break
                    }
                  
        }
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if contentArr.count > 0 {
            
            let vc = operatingThreeDetaileController()
            vc.title = "折线图详情页"
            vc.pushUrl = url
            self.navigationController?.pushViewController(vc, animated: true)
            
            switch self.type {
            
            case .one://烟气系统
        
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_39","TJRC04_40","TJRC04_41","TJRC04_42","TJRC04_43","TJRC04_44","TJRC04_45","TJRC04_46"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_39","TJRC05_40","TJRC05_41","TJRC05_42","TJRC05_43","TJRC05_44","TJRC05_45","TJRC05_46"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            case .two://原料系统
                
                //原料系统
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_28","TJRC04_29"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_28","TJRC05_29"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            case .three://脱硫系统
                
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_02","TJRC04_03","TJRC04_04","TJRC04_05","TJRC04_06","TJRC04_07","TJRC04_08"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_02","TJRC05_03","TJRC05_04","TJRC05_05","TJRC05_06","TJRC05_07","TJRC05_08"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            case .four://水系统
                
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_31","TJRC04_32","TJRC04_33","TJRC04_34"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_31","TJRC05_32","TJRC05_33","TJRC05_34"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            case .five://除尘系统
                
                //除尘系统
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_09","TJRC04_10","TJRC04_11","TJRC04_12"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_09","TJRC05_10","TJRC05_11","TJRC05_12"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            case .six://副产物系统
                
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_30"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_30"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            case .seven://风机系统
                
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_13","TJRC04_14","TJRC04_15","TJRC04_16","TJRC04_17","TJRC04_18","TJRC04_19","TJRC04_20","TJRC04_21","TJRC04_22","TJRC04_23","TJRC04_24","TJRC04_25","TJRC04_26","TJRC04_27"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_13","TJRC05_14","TJRC05_15","TJRC05_16","TJRC05_17","TJRC05_18","TJRC05_19","TJRC05_20","TJRC05_21","TJRC05_22","TJRC05_23","TJRC05_24","TJRC05_25","TJRC05_26","TJRC05_27"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
                
            default://气系统
            
                vc.titleStr = self.titleArr[indexPath.row]
                if self.url == "?itmeid=1" {
                    
                    let titleArr = ["TJRC04_35","TJRC04_36","TJRC04_37","TJRC04_38"]
                    vc.projrctStr = titleArr[indexPath.row]
                }else{
                    
                    let titleArr = ["TJRC05_35","TJRC05_36","TJRC05_37","TJRC05_38"]
                    vc.projrctStr = titleArr[indexPath.row]
                    
                }
            
            }
            
        }
        
    }
   
}
