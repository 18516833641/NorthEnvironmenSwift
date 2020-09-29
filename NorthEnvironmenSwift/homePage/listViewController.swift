//
//  listViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Alamofire

class listViewController: AnalyticsViewController {
    
    var url = ""
    var project = projectType.one
    
    enum projectType {
        case one//运营项目
        case two//公司简介
        case three//资质荣誉
        case four//主营项目
        case five//主导技术
        case six//行业应用
        case seven//工程案例
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource:[t_company_data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "listTableViewCell", bundle: nil), forCellReuseIdentifier: "listTableViewCell")
        
        httpService()
    }
    
    
    
    func httpService() {
        
//        let param = ["username":userText.text as AnyObject,
//
//                     "password":userPassText.text as AnyObject,]
                
                let token = UserDefaults.string(forKey: .token)
                 
                let headers:HTTPHeaders = [
                         "X-AUTH-TOKEN" : token!,
                     ]
        
                print("======\(BERKKURL.Url_Sever + url)")
                
                BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + url, parameters: nil, headers: headers, successed: { (error , response) in
                    
                    if error == nil , let data = response{
                                    
                     let model = data.jsonDataMapModel(t_success_data<t_company_data>.self)
                        
                        print("==============\(String(describing: model))")
                        guard let dataList = model?.data,error == nil else {
                            
//                            self.noData.image = UIImage(named: "sever_error")
//                            self.noData.isHidden = false
                            return
                        }
                        
                        for cellData in dataList {
                           self.dataSource.append(cellData)
                       }
                       
//                       if self.dataSource.count == 0 {
//                           self.noData.image = UIImage(named: "new_nothing3")
//                           self.noData.isHidden = false
//                       }else{
//                           self.noData.isHidden = true
//                       }
                        
                        self.tableView.reloadData()
                                         
                    }

                    
                    
                }) { (error, nil) in
            
                    SVProgressHUD.showError(withStatus: "\(String(describing: error))")
                    SVProgressHUD.dismiss(withDelay: 1.75)
                    print("======\(String(describing: error))")
                }
    }

}




extension listViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:listTableViewCell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell") as? listTableViewCell else {
            let cells = listTableViewCell(style: .default, reuseIdentifier: "listTableViewCell")
            cells.backgroundColor = .groupTableViewBackground
            return cells
        }
        
        let listData = dataSource[indexPath.row]
        
        cell.titleLabel.text = listData.tile
        
//        print("----------------\(BERKKURL.Url_SeverImage + listData.thmb!)")

        cell.listImage.sd_setImage(with: URL(string:BERKKURL.Url_SeverImage + listData.thmb!), placeholderImage: UIImage(named: "zwsj"), options: .refreshCached, completed: nil)
        
        
        if let imageStr = listData.thmb , let imageUrl:URL = URL(string: BERKKURL.Url_SeverImage + imageStr)  {
//            print("----------------\(imageUrl)")
//            cell.listImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: ""), options: .refreshCached, completed: nil)
//            cell.listImage.sd_setImage(with: url, completed: nil)
        }
      
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch project {
            
        case .one://运营项目
            
            let cellData = dataSource[indexPath.row]
            let vc = jxSegmentedViewController()
            vc.title = "运营项目详情"
            vc.listId = "/" + cellData.id!
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case .two://公司简介
            
            break
            
        case .three://荣誉资质
            
//            let cellData = dataSource[indexPath.row]
            let vc = listDetailViewController()
            vc.title = "资质荣誉详情"
//            vc.url = BERKKURL.URL_QualificationList + "/" + cellData.id!
            vc.url = BERKKURL.URL_QualificationList
//            print("-------\(vc.url)")
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case .four://主营业务
            
//            let cellData = dataSource[indexPath.row]
            let vc = listDetailViewController()
            vc.title = "主营业务详情"
            vc.url = BERKKURL.URL_MainList
//            print("-------\(vc.url)")
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case .five://主导技术
            
//            let cellData = dataSource[indexPath.row]
            let vc = listDetailViewController()
            vc.title = "主导技术详情"
            vc.url = BERKKURL.URL_DominantList
//            print("-------\(vc.url)")
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case .six://行业应用
            
//            let cellData = dataSource[indexPath.row]
            let vc = listDetailViewController()
            vc.title = "行业应用详情"
            vc.url = BERKKURL.URL_IndustryList
//            print("-------\(vc.url)")
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case .seven://工程案例
            
//            let cellData = dataSource[indexPath.row]
            let vc = listDetailViewController()
            vc.title = "工程案例详情"
            vc.url = BERKKURL.URL_EngineeringList
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
        }
        
        
//
//        if self.menuTheCellback != nil {
//            self.menuTheCellback!(cellData)
//        }
//
//        self.navigationController?.popViewController(animated: true)
        
    }
   
}
