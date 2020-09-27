//
//  userinfoViewController.swift
//  NorthEnvironmenSwift
//
//  Created by Mac on 2020/9/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class userinfoViewController: AnalyticsViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let nameArr = ["*姓名","*手机","*身份证号"]
    let imageArr = ["张三","15661004788","152601199709070000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "baseTableViewCell", bundle: nil), forCellReuseIdentifier: "baseTableViewCell")
    }

}

extension userinfoViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:baseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "baseTableViewCell") as? baseTableViewCell else {
            let cells = baseTableViewCell(style: .default, reuseIdentifier: "baseTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        cell.headIcon.isHidden = true
        cell.backImage.isHidden = true
        cell.rightLabel.isHidden = false
        cell.titleLabel.text = nameArr[indexPath.row]
        cell.rightLabel.text = imageArr[indexPath.row]
        
        
        return cell
        
    }
   
}

