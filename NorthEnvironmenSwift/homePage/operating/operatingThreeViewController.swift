//
//  operatingThreeViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class operatingThreeViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
    
    var url = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    //总系统
    let titleArr = ["脱硫入口烟气O₂浓度","脱硫入口烟气SO₂浓度","脱硫入口烟气NOx浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO₂浓度","脱硫塔压差","除尘器压差","本小时出口SO₂小时均值","上一小时出口SO₂小时均值","上一小时入口SO₂小时均值"]
    
    //脱硫系统
    let titleArr1 = ["脱硫塔入口温度","脱硫塔出口温度","脱硫塔入口压力","脱硫塔出口压力","1#喷射器进口压力","2#喷射器进口压力","3#喷射器进口压力"]
    
    //除尘系统
    let titleArr2 = ["除尘器出口温度","除尘器出口压力","1#加湿机压力","2#加湿机压力"]
    
    //风机系统
    let titleArr3 = ["高压变频器电流反馈","高压变频器频率反馈","高压变频器变频运行指示","高压变频器工频运行指示","高压变频器远程指示","高压变频器系统就绪指示","高压变频器运行指示","高压变频器变频报警","高压变频器变频故障","主引风机轴承温度1","主引风机轴承温度2","主引风机冷却水压力","主引风机风门执行器开度","主引风机电机轴承温度1","主引风机电机轴承温度2"]
    
    //原料系统
    let titleArr4 = ["脱硫剂喷射器进口压力","原料仓重量"]
    
    //副产物系统
    let titleArr5 = ["副产物仓重量"]
    
    //水系统
    let titleArr6 = ["进水流量计","1#加湿机加水流量","2#加湿机加水流量","工艺水箱液位"]
    
    //气系统
    let titleArr7 = ["储罐氮气主管压力","喷吹主管压力","空气流量计","氮气流量计"]
    
    //烟气系统
    let titleArr8 = ["冷风阀开度反馈","一氧化碳浓度检测1","原烟气挡板门开到位","原烟气挡板门关到位","净烟气挡板门开到位","净烟气挡板门关到位","旁路挡板门开到位","旁路挡板门关到位"]
    
    var contentArr = ["","","","","","","","","","",""]
    var contentArr1 = ["","","","","","",""]
    var contentArr2 = ["","","",""]
    var contentArr3 = ["","","","","","","","","","","","","","",""]
    var contentArr4 = ["",""]
    var contentArr5 = [""]
    var contentArr6 = ["","","",""]
    var contentArr7 = ["","","",""]
    var contentArr8 = ["","","","","","","",""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        httpService()
        
        tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
    }
    
    
     func httpService() {
                
               let token = UserDefaults.string(forKey: .token)
                
               let headers:HTTPHeaders = [
                        "X-AUTH-TOKEN" : token!,
                    ]
        
        print("=====\(BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url)")
                BKHttpTool.requestData(requestType: .Put, URLString: BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url, parameters: nil, headers: headers, successed: { (error, response) in
                    
                    if error == nil , let data = response{
                        
                    let json = JSON(data)
                        
                        print("========\(json)")
                        
                        if self.url == "?itmeid=1" {
                            
                            //总系统
                            self.contentArr = [json["data"]["TJRC04_01"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
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
                            ]
                            
                           //脱硫系统
                           self.contentArr1 = [json["data"]["TJRC04_02"].stringValue,
                                              json["data"]["TJRC04_03"].stringValue,
                                              json["data"]["TJRC04_04"].stringValue,
                                              json["data"]["TJRC04_05"].stringValue,
                                              json["data"]["TJRC04_06"].stringValue,
                                              json["data"]["TJRC04_07"].stringValue,
                                              json["data"]["TJRC04_08"].stringValue
                               ]
                               
                           //除尘系统
                           self.contentArr2 = [json["data"]["TJRC04_09"].stringValue,
                                              json["data"]["TJRC04_10"].stringValue,
                                              json["data"]["TJRC04_11"].stringValue,
                                              json["data"]["TJRC04_12"].stringValue,
                               ]
                               
                           //风机系统
                           self.contentArr3 = [json["data"]["TJRC04_13"].stringValue,
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
                               ]
                           //原料系统
                          self.contentArr4 = [json["data"]["TJRC04_28"].stringValue,
                                              json["data"]["TJRC04_29"].stringValue
                                        
                              ]
                               
                           //副产物系统
                           self.contentArr5 = [json["data"]["TJRC04_30"].stringValue,
                               ]
                           
                           //水系统
                           self.contentArr6 = [json["data"]["TJRC04_31"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC04_32"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC04_33"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC04_34"].stringValue,
                               ]
                           
                           //气系统
                           self.contentArr7 = [json["data"]["TJRC04_35"].stringValue,
                                               json["data"]["TJRC04_36"].stringValue,
                                               json["data"]["TJRC04_37"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC04_38"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                           ]
                           
                           //烟气系统
                           self.contentArr8 = [json["data"]["TJRC04_39"].stringValue,
                                               json["data"]["TJRC04_40"].stringValue,
                                               json["data"]["TJRC04_41"].stringValue,
                                               json["data"]["TJRC04_42"].stringValue,
                                               json["data"]["TJRC04_43"].stringValue,
                                               json["data"]["TJRC04_44"].stringValue,
                                               json["data"]["TJRC04_45"].stringValue,
                                               json["data"]["TJRC04_46"].stringValue,
                           ]
                            
                        }else{
                            //总系统
                            self.contentArr = [json["data"]["TJRC05_01"].stringValue,
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
                            ]
                            
                           //脱硫系统
                           self.contentArr1 = [json["data"]["TJRC05_02"].stringValue,
                                              json["data"]["TJRC05_03"].stringValue,
                                              json["data"]["TJRC05_04"].stringValue,
                                              json["data"]["TJRC05_05"].stringValue,
                                              json["data"]["TJRC05_06"].stringValue,
                                              json["data"]["TJRC05_07"].stringValue,
                                              json["data"]["TJRC05_08"].stringValue
                               ]
                               
                           //除尘系统
                           self.contentArr2 = [json["data"]["TJRC05_09"].stringValue,
                                              json["data"]["TJRC05_10"].stringValue,
                                              json["data"]["TJRC05_11"].stringValue,
                                              json["data"]["TJRC05_12"].stringValue,
                               ]
                               
                           //风机系统
                           self.contentArr3 = [json["data"]["TJRC05_13"].stringValue,
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
                               ]
                           //原料系统
                          self.contentArr4 = [json["data"]["TJRC05_28"].stringValue,
                                              json["data"]["TJRC05_29"].stringValue
                                        
                              ]
                               
                           //副产物系统
                           self.contentArr5 = [json["data"]["TJRC05_30"].stringValue,
                               ]
                           
                           //水系统
                           self.contentArr6 = [json["data"]["TJRC05_31"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC05_32"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC05_33"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC05_34"].stringValue,
                               ]
                           
                           //气系统
                           self.contentArr7 = [json["data"]["TJRC05_35"].stringValue,
                                               json["data"]["TJRC05_36"].stringValue,
                                               json["data"]["TJRC05_37"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                                               json["data"]["TJRC05_38"].stringValue.replacingOccurrences(of: "m3", with: "m³"),
                           ]
                           
                           //烟气系统
                           self.contentArr8 = [json["data"]["TJRC05_39"].stringValue,
                                               json["data"]["TJRC05_40"].stringValue,
                                               json["data"]["TJRC05_41"].stringValue,
                                               json["data"]["TJRC05_42"].stringValue,
                                               json["data"]["TJRC05_43"].stringValue,
                                               json["data"]["TJRC05_44"].stringValue,
                                               json["data"]["TJRC05_45"].stringValue,
                                               json["data"]["TJRC05_46"].stringValue,
                           ]
                            
                        }
                    
                   

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


extension operatingThreeViewController:UITableViewDelegate,UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerArr = ["总系统","脱硫系统","除尘系统","风机系统","原料系统","副产物系统","水系统","气系统","烟气系统"]
        
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        headerView.backgroundColor = UIColor(red: 26/255.0, green: 35/255.0, blue: 49/255.0, alpha: 1)
        self.view.addSubview(headerView)
        
        let line = UILabel.init(frame: CGRect(x: 20, y: 5, width: 8, height: 20))
        line.backgroundColor = UIColor(red: 56/255.0, green: 167/255.0, blue: 184/255.0, alpha: 1)
        headerView.addSubview(line)
        
        let titleLabel = UILabel.init(frame: CGRect(x: 40, y: 5, width: self.view.bounds.width-40, height: 20))
        titleLabel.text = headerArr[section]
        titleLabel.textColor = UIColor(red: 56/255.0, green: 167/255.0, blue: 184/255.0, alpha: 1)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 15)
        headerView.addSubview(titleLabel)
        
        let imageBut = UIButton.init(frame: CGRect(x: headerView.frame.width - 100, y: 5, width: 80, height: 20))
        imageBut.addTarget(self, action: #selector(buttonAction(select:)), for: .touchUpInside)
        imageBut.tag = section
        imageBut.setBackgroundImage(UIImage(named: "button_03"), for: .normal)
        headerView.addSubview(imageBut)
        
        return headerView
        
    }
    
    @objc func buttonAction(select:UIButton) {
        
        print(select.tag)
        let vc = operatingFiveDetaileController()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        switch select.tag {
        case 0:
            vc.title = "总系统"
            vc.titleArr = self.titleArr
            vc.contentArr = self.contentArr
            
            
        case 1:
            vc.title = "脱硫系统"
            vc.titleArr = self.titleArr1
            vc.contentArr = self.contentArr1
            
        case 2:
            vc.title = "除尘系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        case 3:
            vc.title = "风机系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        case 4:
            vc.title = "原料系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        case 5:
            vc.title = "副产物系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        case 6:
            vc.title = "水系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        case 7:
            vc.title = "气系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        case 8:
            vc.title = "烟气系统"
            vc.titleArr = self.titleArr2
            vc.contentArr = self.contentArr2
            
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    //组高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    //行高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0:
            return 11
            
        case 1:
            return 7
            
        case 2:
            return 4
            
        case 3:
            return 15
            
        case 4:
            return 2
            
        case 5:
            return 1
            
        case 6:
            return 4
            
        case 7:
            return 4
            
        case 8:
            return 8
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:operatingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "operatingTableViewCell") as? operatingTableViewCell else {
            let cells = operatingTableViewCell(style: .default, reuseIdentifier: "operatingTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = titleArr[indexPath.row]
            cell.contenLabel.text = contentArr[indexPath.row]
            
        case 1:
            cell.titleLabel.text = titleArr1[indexPath.row]
            cell.contenLabel.text = contentArr1[indexPath.row]
            
        case 2:
            
            cell.titleLabel.text = titleArr2[indexPath.row]
            cell.contenLabel.text = contentArr2[indexPath.row]
            
        case 3:
            
            cell.titleLabel.text = titleArr3[indexPath.row]
            cell.contenLabel.text = contentArr3[indexPath.row]
            
        case 4:
            
            cell.titleLabel.text = titleArr4[indexPath.row]
            cell.contenLabel.text = contentArr4[indexPath.row]
            
        case 5:
            
            cell.titleLabel.text = titleArr5[indexPath.row]
            cell.contenLabel.text = contentArr5[indexPath.row]
            
        case 6:
            
            cell.titleLabel.text = titleArr6[indexPath.row]
            cell.contenLabel.text = contentArr6[indexPath.row]
            
        case 7:
           
            cell.titleLabel.text = titleArr7[indexPath.row]
            cell.contenLabel.text = contentArr7[indexPath.row]
            
        case 8:
            
            cell.titleLabel.text = titleArr8[indexPath.row]
            cell.contenLabel.text = contentArr8[indexPath.row]
            
        default:
            break
        }
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = operatingThreeDetaileController()
        vc.title = "数据曲线详情"
        vc.pushUrl = url
        self.navigationController?.pushViewController(vc, animated: true)
        
        switch indexPath.section {
        case 0:
            //x总系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_01","TJRC04_47","TJRC04_48","TJRC04_49","TJRC04_50","TJRC04_51","TJRC04_52","TJRC04_53","TJRC04_54","TJRC04_55","TJRC04_56"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_01","TJRC05_47","TJRC05_48","TJRC05_49","TJRC05_50","TJRC05_51","TJRC05_52","TJRC05_53","TJRC05_54","TJRC05_55","TJRC05_56"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }
            
        case 1:
            //脱硫系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_02","TJRC04_03","TJRC04_04","TJRC04_05","TJRC04_06","TJRC04_07","TJRC04_08"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_02","TJRC05_03","TJRC05_04","TJRC05_05","TJRC05_06","TJRC05_07","TJRC05_08"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }
            
            


        case 2:
            //除尘系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_09","TJRC04_10","TJRC04_11","TJRC04_12"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_09","TJRC05_10","TJRC05_11","TJRC05_12"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }

        case 3:
            //风机系统
            
            
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_13","TJRC04_14","TJRC04_15","TJRC04_16","TJRC04_17","TJRC04_18","TJRC04_19","TJRC04_20","TJRC04_21","TJRC04_22","TJRC04_23","TJRC04_24","TJRC04_25","TJRC04_26","TJRC04_27"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_13","TJRC05_14","TJRC05_15","TJRC05_16","TJRC05_17","TJRC05_18","TJRC05_19","TJRC05_20","TJRC05_21","TJRC05_22","TJRC05_23","TJRC05_24","TJRC05_25","TJRC05_26","TJRC05_27"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }

        case 4:
            //原料系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_28","TJRC04_29"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_28","TJRC05_29"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }

        case 5:

            //副产物系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_30"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_30"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }

        case 6:

            //水系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_31","TJRC04_32","TJRC04_33","TJRC04_34"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_31","TJRC05_32","TJRC05_33","TJRC05_34"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }
            

        case 7:

            //气系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_35","TJRC04_36","TJRC04_37","TJRC04_38"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_35","TJRC05_36","TJRC05_37","TJRC05_38"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }

        case 8:

            //烟气系统
            if self.url == "?itmeid=1" {
                
                let titleArr = ["TJRC04_39","TJRC04_40","TJRC04_41","TJRC04_42","TJRC04_43","TJRC04_44","TJRC04_45","TJRC04_46"]
                vc.projrctStr = titleArr[indexPath.row]
            }else{
                
                let titleArr = ["TJRC05_39","TJRC05_40","TJRC05_41","TJRC05_42","TJRC05_43","TJRC05_44","TJRC05_45","TJRC05_46"]
                vc.projrctStr = titleArr[indexPath.row]
                
            }
            

        default:
            break
        }
        
       
    }
   
}
