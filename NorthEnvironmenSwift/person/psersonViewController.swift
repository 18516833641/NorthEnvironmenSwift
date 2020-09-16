//
//  psersonViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class psersonViewController: AnalyticsViewController {
    
    @IBOutlet weak var phone_Number: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let nameArr = ["账户信息","修改密码"]
    let imageArr = ["person1","person2"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "baseTableViewCell", bundle: nil), forCellReuseIdentifier: "baseTableViewCell")
        
        // Do any additional setup after loading the view.
    }

}

extension psersonViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:baseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "baseTableViewCell") as? baseTableViewCell else {
            let cells = baseTableViewCell(style: .default, reuseIdentifier: "baseTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        cell.headIcon.image = UIImage.init(named: imageArr[indexPath.item])
        cell.titleLabel.text = nameArr[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cellData = dataSource[indexPath.row]
//        if self.clickOnTheCallback != nil {
//            self.clickOnTheCallback!(cellData.title ?? "")
//        }
//
//        if self.menuTheCellback != nil {
//            self.menuTheCellback!(cellData)
//        }
//
//        self.navigationController?.popViewController(animated: true)
        
    }
   
}
