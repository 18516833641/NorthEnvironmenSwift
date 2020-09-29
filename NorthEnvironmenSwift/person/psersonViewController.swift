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
        let userNm = UserDefaults.string(forKey: .userNm)
        phone_Number.text = userNm
        // Do any additional setup after loading the view.
    }

}

extension psersonViewController:UITableViewDelegate,UITableViewDataSource{
    
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
        cell.headIcon.image = UIImage.init(named: imageArr[indexPath.item])
        cell.titleLabel.text = nameArr[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    switch indexPath.row {
        case 0:
            let vc = userinfoViewController()
            vc.title = "账户信息"
            self.navigationController?.pushViewController(vc, animated: true)
           
           break
        case 1:
            let vc = passWordViewController()
            vc.title = "修改密码"
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
        default: break
            
        }
        
    }
   
}
