//
//  operatingFourViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class operatingFourViewController: AnalyticsViewController,JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
    
    var url = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    let nameArr = ["故障中","已解除"]
    let rightArr = ["2020-06-09","2020-07-09"]
    let imageArr = ["gzz","yjc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         tableView.register(UINib(nibName: "baseTableViewCell", bundle: nil), forCellReuseIdentifier: "baseTableViewCell")
    }


}

extension operatingFourViewController:UITableViewDelegate,UITableViewDataSource{
    
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
        cell.rightLabel.isHidden = false
        cell.headIcon.image = UIImage.init(named: imageArr[indexPath.item])
        cell.titleLabel.text = nameArr[indexPath.row]
        cell.rightLabel.text = rightArr[indexPath.row]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    switch indexPath.row {
        case 0:
            let vc = operatingFourDetaileController()
            vc.title = "已解除详情页"
            vc.typeStr = "0"
            vc.projrctStr = url//区分项目几
            self.navigationController?.pushViewController(vc, animated: true)
           
           break
        case 1:
            let vc = operatingFourDetaileController()
            vc.title = "故障中详情页"
            vc.typeStr = "1"
            vc.projrctStr = url // 区分项目几
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
        default: break
            
        }
        
    }
   
}
