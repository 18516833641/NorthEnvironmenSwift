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
    
    
     func httpService() -> Void {
                
               let token = UserDefaults.string(forKey: .token)
                
               let headers:HTTPHeaders = [
                        "X-AUTH-TOKEN" : token!,
                    ]
                BKHttpTool.requestData(requestType: .Put, URLString: BERKKURL.Url_Sever + BERKKURL.URL_OperatingList + url, parameters: nil, headers: headers, successed: { (error, response) in
                    
                    if error == nil , let data = response{
                        
                    let json = JSON(data)
                    
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
                    self.contentArr6 = [json["data"]["TJRC04_31"].stringValue,
                                        json["data"]["TJRC04_32"].stringValue,
                                        json["data"]["TJRC04_33"].stringValue,
                                        json["data"]["TJRC04_34"].stringValue,
                        ]
                    
                    //气系统
                    self.contentArr7 = [json["data"]["TJRC04_35"].stringValue,
                                        json["data"]["TJRC04_36"].stringValue,
                                        json["data"]["TJRC04_37"].stringValue,
                                        json["data"]["TJRC04_38"].stringValue,
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

                    self.tableView.reloadData()
                         
                    }
                    
                }) { (error, nil) in
                    SVProgressHUD.showError(withStatus: "\(String(describing: error))")
                    SVProgressHUD.dismiss(withDelay: 1)
                    print("======\(String(describing: error))")
                }
                
        }

}


extension operatingThreeViewController:UITableViewDelegate,UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerArr = ["脱硫系统","除尘系统","风机系统","原料系统","副产物系统","水系统","气系统","烟气系统"]
        
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        headerView.backgroundColor = UIColor(red: 26/255.0, green: 35/255.0, blue: 49/255.0, alpha: 1)
        self.view.addSubview(headerView)
        
        let titleLabel = UILabel.init(frame: CGRect(x: 20, y: 5, width: self.view.bounds.width, height: 20))
        titleLabel.text = headerArr[section]
        titleLabel.textColor = .lightGray
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        headerView.addSubview(titleLabel)
        
        let image = UIImageView.init(frame: CGRect(x: headerView.frame.width - 60, y: 5, width: 40, height: 20))
        image.backgroundColor = .red
        headerView.addSubview(image)
        
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
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
            return 7
            
        case 1:
            return 4
            
        case 2:
            return 15
            
        case 3:
            return 2
            
        case 4:
            return 1
            
        case 5:
            return 4
            
        case 6:
            return 4
            
        case 7:
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
            cell.titleLabel.text = titleArr1[indexPath.row]
            cell.contenLabel.text = contentArr1[indexPath.row]
            
        case 1:
            
            cell.titleLabel.text = titleArr2[indexPath.row]
            cell.contenLabel.text = contentArr2[indexPath.row]
            
        case 2:
            
            cell.titleLabel.text = titleArr3[indexPath.row]
            cell.contenLabel.text = contentArr3[indexPath.row]
            
        case 3:
            
            cell.titleLabel.text = titleArr4[indexPath.row]
            cell.contenLabel.text = contentArr4[indexPath.row]
            
        case 4:
            
            cell.titleLabel.text = titleArr5[indexPath.row]
            cell.contenLabel.text = contentArr5[indexPath.row]
            
        case 5:
            
            cell.titleLabel.text = titleArr6[indexPath.row]
            cell.contenLabel.text = contentArr6[indexPath.row]
            
        case 6:
           
            cell.titleLabel.text = titleArr7[indexPath.row]
            cell.contenLabel.text = contentArr7[indexPath.row]
            
        case 7:
            
            cell.titleLabel.text = titleArr8[indexPath.row]
            cell.contenLabel.text = contentArr8[indexPath.row]
            
        default:
            break
        }
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = operatingThreeDetaileController()
        vc.title = "折线图详情页"
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}
