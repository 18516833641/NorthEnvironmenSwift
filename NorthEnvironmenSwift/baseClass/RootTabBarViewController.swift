//
//  RootTabBarViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

         self.tabBar.barTintColor = UIColor.init(red: 26/255.0, green: 35/255.0, blue: 49/255.0, alpha: 1)
        
        let homevc = homeViewController()
        homevc.tabBarItem.imageInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        self.addChildVCWithImg(childVC: homevc,
                            childTitle: "首页",
                             imageName: "home",
                     selectedImageName: "homeSelect",
                                 index: 0)
        
        let Explorevc = psersonViewController()
        Explorevc.tabBarItem.imageInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        self.addChildVCWithImg(childVC: Explorevc,
                            childTitle: "个人",
                             imageName: "person",
                     selectedImageName: "personSelect",
                                 index: 1)
        
        let Chatvc = setUpViewController()
        Chatvc.tabBarItem.imageInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        self.addChildVCWithImg(childVC: Chatvc,
                            childTitle: "设置",
                             imageName: "setUp",
                     selectedImageName: "setUpSelect",
                                 index: 2)
        
        modifyTabbar()
    }


    // 添加子控制器添加图片
        private func addChildVCWithImg(childVC: UIViewController, childTitle: String , imageName: String, selectedImageName:String ,index: Int)
        {
                //0.新建一个子控制器对象
                let navigation = RootNavigationViewController(rootViewController: childVC)
    //            //1.设置子控制器标题
                childVC.title = childTitle
                //2.设置子控制器排序
                childVC.tabBarItem.tag = index
                //3.设置子控制器未选中状态下的图片
                childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
            
            
                //4.x设置子控制器选中状态下的图片
                childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        //        childVC.tabBarItem.selectedImage?.size = CGSize(width: 50, height: 50)
                //5.将子控制器加入到tabbar控制器中
                self.addChild(navigation)
                
        //        self.configurationAppTabBarAndNavigationBar()
            }
        
        
        /// 修改原生tabbar
        func modifyTabbar() -> Void {
            //设置选中字体颜色
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(red: 40/255.0, green: 243/255.0, blue: 253/255.0, alpha: 1)], for: UIControl.State.selected)
    //        //设置未选中状态下字体颜色
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(red: 19/255.0, green: 134/255.0, blue: 139/255.0, alpha: 1)], for: UIControl.State.normal)
            
            
            //因为tabbar有默认的渲染色，所以要先去掉，否则颜色并不是想要的颜色
            UITabBar.appearance().isTranslucent = false
            //之后再设置tabbar的背景色
            UITabBar.appearance().barTintColor = #colorLiteral(red: 0.1254901961, green: 0.1490196078, blue: 0.1882352941, alpha: 1)
            
            
//            //下面这个方法可以取消掉tabbar上的灰色线
//            if #available(iOS 13, *) {
//              let appearance = self.tabBar.standardAppearance.copy()
//              appearance.backgroundImage = UIImage()
//              appearance.shadowImage = UIImage()
//              appearance.shadowColor = .clear
//              self.tabBar.standardAppearance = appearance
//            } else {
//              self.tabBar.shadowImage = UIImage()
//              self.tabBar.backgroundImage = UIImage()
//            }
        }
        
        
        override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//            print("ssss\(item.tag)")
            
            switch item.tag {
            case 1:
                do {
    //                NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue:"isTest"), object: nil)
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addAction"), object: nil, userInfo: nil)
                        
                }
            default:
                break
            }
                
        }
}
