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
    
    //脱硫系统
    let titleArr1 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr2 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr3 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr4 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr5 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr6 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr7 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
    let titleArr8 = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值"]
    
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
