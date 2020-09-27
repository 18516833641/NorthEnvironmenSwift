//
//  setUpViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class setUpViewController: AnalyticsViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    let nameArr = ["清除缓存","关于软件","版本更新","退出登录"]
//    let imageArr = ["setUp1","setUp2","setUp3","setUp4"]
    
    let nameArr = ["清除缓存","关于软件","退出登录"]
    let imageArr = ["setUp1","setUp2","setUp4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "baseTableViewCell", bundle: nil), forCellReuseIdentifier: "baseTableViewCell")

        // Do any additional setup after loading the view.
    }

}


extension setUpViewController:UITableViewDelegate,UITableViewDataSource{
    
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
        cell.headIcon.image = UIImage.init(named: imageArr[indexPath.item])
        cell.titleLabel.text = nameArr[indexPath.row]
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
           let result = "温馨提示"
           let alertController = UIAlertController(title: result, message: "确认清楚缓存嘛？", preferredStyle: .alert)
           self.present(alertController, animated: true, completion: nil)
           alertController.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
           alertController.addAction(UIAlertAction(title: "取消", style: .destructive, handler: nil))
           
           break
        case 1:
            let vc = aboutViewController()
            vc.title = "关于我们"
//            vc.project = .seven
//            vc.url = BERKKURL.URL_EngineeringList
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
//        case 2:
//           let vc = listViewController()
//           vc.title = "软件更新"
//           vc.project = .seven
//           vc.url = BERKKURL.URL_EngineeringList
//           self.navigationController?.pushViewController(vc, animated: true)
//
//            break
        case 2:
            let result = "温馨提示"
            let alertController = UIAlertController(title: result, message: "确认退出登录嘛？", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            alertController.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "取消", style: .destructive, handler: nil))
            
            break
        default: break
            
        }
        
    }
   
}
