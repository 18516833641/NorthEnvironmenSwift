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
    
    let nameArr = ["*姓名","*手机"]
    var contentArr = ["张三","15661004788"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
         let userNm = UserDefaults.string(forKey: .userNm)
         let phn = UserDefaults.string(forKey: .phn)
        
        contentArr = [userNm ?? "",phn ?? ""]
        
        tableView.register(UINib(nibName: "baseTableViewCell", bundle: nil), forCellReuseIdentifier: "baseTableViewCell")
    }

}

extension userinfoViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
        cell.headIcon.isHidden = true
        cell.backImage.isHidden = true
        cell.rightLabel.isHidden = false
        cell.titleLabel.text = nameArr[indexPath.row]
        cell.rightLabel.text = contentArr[indexPath.row]
        
        
        return cell
        
    }
   
}

