//
//  operatingFiveDetaileController.swift
//  NorthEnvironmenSwift
//
//  Created by Mac on 2020/10/6.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class operatingFiveDetaileController: AnalyticsViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleArr:[String] = []
    
    var contentArr:[String] = []
    
    var biaotiArr:[String] = []
    
    var titleUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = self.title
        tableView.register(UINib(nibName: "operatingTableViewCell", bundle: nil), forCellReuseIdentifier: "operatingTableViewCell")
    }


   

}


extension operatingFiveDetaileController:UITableViewDelegate,UITableViewDataSource{
    
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
        cell.contenLabel.text = contentArr[indexPath.row]
      
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = operatingThreeDetaileController()
        vc.title = "数据曲线详情"
        vc.pushUrl = titleUrl
        vc.projrctStr = biaotiArr[indexPath.row]
        vc.titleStr = titleArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
       
    }
    
    
    
   
}
