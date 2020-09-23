//
//  operatingTwoViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class operatingTwoViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let titleArr = ["脱硫入口烟气O2浓度","脱硫入口烟气SO2浓度","脱脱硫入口烟气NOX浓度","脱硫入口烟气粉尘含量","脱硫入口烟气流量","脱硫出口烟气SO2浓度","脱硫塔压差","除尘器压差","本小时出口SO2小时均值","上一小时出口SO2小时均值","上一小时入口SO2小时均值","上一小时入口SO2小时均值"]
    let contentArr = ["person1","person2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
        
    }


    //烟气系统
    @IBAction func yanqiAction(_ sender: Any) {
        
        
        let vc = listViewController()
        vc.title = "运营项目"
        vc.url = BERKKURL.URL_OperatingList
        vc.project = .one
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //原料系统
    @IBAction func yuanliaoAction(_ sender: Any) {
        
    }
    
    //脱硫系统
    @IBAction func tuoliuAction(_ sender: Any) {
        
    }
    
    //水系统
    @IBAction func shuiAction(_ sender: Any) {
        
    }
    
    //除尘系统
    @IBAction func chuchengAction(_ sender: Any) {
        
    }
    
    //副产物系统
    @IBAction func fuchanwuAction(_ sender: Any) {
        
    }
    
    //风机系统
    @IBAction func fengjiAction(_ sender: Any) {
        
    }
    
    //气系统
    @IBAction func qiAction(_ sender: Any) {
        
    }
}


extension operatingTwoViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:operatingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "operatingTableViewCell") as? operatingTableViewCell else {
            let cells = operatingTableViewCell(style: .default, reuseIdentifier: "operatingTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        
         cell.contenLabel.text = titleArr[indexPath.row]
         cell.titleLabel.text = titleArr[indexPath.row]
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
}
