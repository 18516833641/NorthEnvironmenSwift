//
//  homeViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class homeViewController: AnalyticsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
        // Do any additional setup after loading the view.
    }

    //运营项目
    @IBAction func zeroAction(_ sender: Any) {
        
        let vc = listViewController()
        vc.title = "运营项目"
        vc.url = BERKKURL.URL_OperatingList
        vc.project = .one
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //公司简介
    @IBAction func onebuttonAction(_ sender: Any) {
        
        let vc = listDetailViewController()
        vc.title = "公司简介"
        vc.project = "1"
        vc.url = BERKKURL.URL_CompanyList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //资质荣誉
    @IBAction func twoButtonAction(_ sender: Any) {
        
        let vc = listViewController()
        vc.title = "资质荣誉"
        vc.project = .three
        vc.url = BERKKURL.URL_QualificationList 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //主页业务
    @IBAction func threeButtonAction(_ sender: Any) {
        
        let vc = listViewController()
        vc.title = "主营业务"
        vc.project = .four
        vc.url = BERKKURL.URL_MainList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //主导技术
    @IBAction func fourButtonAction(_ sender: Any) {
        
        let vc = listViewController()
        vc.title = "主导技术"
        vc.project = .five
        vc.url = BERKKURL.URL_DominantList
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //行业应用
    @IBAction func fiveButtonAction(_ sender: Any) {
        
        let vc = listViewController()
        vc.title = "行业应用"
        vc.project = .six
        vc.url = BERKKURL.URL_IndustryList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //工程案例
    @IBAction func sixButtonAction(_ sender: Any) {
        
        let vc = listViewController()
        vc.title = "工程案例"
        vc.project = .seven
        vc.url = BERKKURL.URL_EngineeringList
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
