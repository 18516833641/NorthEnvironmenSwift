//
//  operatingTwoDetaileController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/27.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class operatingTwoDetaileController: AnalyticsViewController {

    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //总系统
    let titleArr = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
    }

}



extension operatingTwoDetaileController:UITableViewDelegate,UITableViewDataSource{
    
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
        
         
         cell.titleLabel.text = titleArr1[indexPath.row]
         cell.contenLabel.text = titleArr1[indexPath.row]
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = operatingThreeDetaileController()
        vc.title = "折线图详情页"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
   
}
