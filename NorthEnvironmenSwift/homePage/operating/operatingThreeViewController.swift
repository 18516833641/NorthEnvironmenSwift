//
//  operatingThreeViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class operatingThreeViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let titleArr1 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr2 = ["除尘器出口温度","除尘器出口压力","1#加湿机压力","2#加湿机压力"]
    
    let titleArr3 = ["高压变频器电流反馈","高压变频器频率反馈","高压变频器变频运行指示","高压变频器工频运行指示","高压变频器远程指示","高压变频器系统就绪指示","高压变频器运行指示","高压变频器变频报警","高压变频器变频故障","主引风机轴承温度1","主引风机轴承温度2","主引风机冷却水压力","主引风机风门执行器开度","主引风机电机轴承温度1","主引风机电机轴承温度2"]
    
    let titleArr4 = ["脱硫剂喷射器进口压力","原料仓重量"]
    
    let titleArr5 = ["副产物仓重量"]
    
    let titleArr6 = ["进水流量计","1#加湿机加水流量","2#加湿机加水流量","工艺水箱液位"]
    
    let titleArr7 = ["储罐氮气主管压力","喷吹主管压力","空气流量计","氮气流量计"]
    
    let titleArr8 = ["冷风阀开度反馈","一氧化碳浓度检测1","原烟气挡板门开到位","原烟气挡板门关到位","净烟气挡板门开到位","净烟气挡板门关到位","旁路挡板门开到位","旁路挡板门关到位"]
    
      let contentArr = ["person1","person2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
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
            return 12
            
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
            cell.contenLabel.text = titleArr1[indexPath.row]
            cell.titleLabel.text = titleArr1[indexPath.row]
            
        case 1:
            cell.contenLabel.text = titleArr2[indexPath.row]
            cell.titleLabel.text = titleArr2[indexPath.row]
            
        case 2:
            cell.contenLabel.text = titleArr3[indexPath.row]
            cell.titleLabel.text = titleArr3[indexPath.row]
            
        case 3:
            cell.contenLabel.text = titleArr4[indexPath.row]
            cell.titleLabel.text = titleArr4[indexPath.row]
            
        case 4:
            cell.contenLabel.text = titleArr5[indexPath.row]
            cell.titleLabel.text = titleArr5[indexPath.row]
            
        case 5:
            cell.contenLabel.text = titleArr6[indexPath.row]
            cell.titleLabel.text = titleArr6[indexPath.row]
            
        case 6:
            cell.contenLabel.text = titleArr7[indexPath.row]
            cell.titleLabel.text = titleArr7[indexPath.row]
            
        case 7:
            cell.contenLabel.text = titleArr8[indexPath.row]
            cell.titleLabel.text = titleArr8[indexPath.row]
            
        default:
            return cell
        }
        
//         cell.contenLabel.text = titleArr1[indexPath.row]
//         cell.titleLabel.text = titleArr1[indexPath.row]
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
}
