//
//  AppDelegate.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/17.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
 
    var window: UIWindow?

    var umUserInfo:[AnyHashable]?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //注册友盟
        UMConfigure.initWithAppkey("5f7e03aa9e10b50ad97bc2a8", channel: "App Store")
        
        // Push组件基本功能配置
        let entity = UMessageRegisterEntity.init()
        entity.types = Int((UMessageAuthorizationOptions.badge.rawValue) | (UMessageAuthorizationOptions.alert.rawValue) | (UMessageAuthorizationOptions.sound.rawValue))
        
        UMessage.registerForRemoteNotifications(launchOptions: launchOptions, entity: entity) { (granted, error) in

            if granted {
                // 用户选择了接收Push消息
                print("用户接收Push消息")
            } else {
                // 用户拒绝接收Push消息

                print("用户拒绝接收Push消息")

            }

        }
        
        //iOS10必须添加下面这段代码
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current
            center().delegate = self
            center().requestAuthorization(options:[.badge,.alert,.sound] , completionHandler: { (granted, error) in
                if granted {
                    //点击允许
                    //这里可以添加一些自己的逻辑
                    print("用户接收Push消息------")
                }else{
                    //点击不允许
                    //这里可以添加一些自己的逻辑
                    print("用户拒绝接收Push消息-------")
                }
            })
            
        } else {
            // Fallback on earlier versions
        }
        
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        //设置rootViewController
        let vc = loginViewController()
       //
        let rootnavagation = RootNavigationViewController.init(rootViewController: vc)
        
        self.window?.rootViewController = rootnavagation
        
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceId = deviceToken.map{ String(format: "%02.2hhx", $0) }.joined()
        
        UserDefaults.set(value:deviceId, forKey: UserDefaults.LoginInfo.deviceId)
    }

}

extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
           UMessage.didReceiveRemoteNotification(userInfo)
           
       }
      
   @available(iOS 10.0, *)
   //iOS10新增：处理前台收到通知的代理方法
   func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       let userInfo = notification.request.content.userInfo
       if (notification.request.trigger?.isKind(of: UNPushNotificationTrigger.self))! {
           let info = userInfo as NSDictionary
           print(info)
           //应用处于前台时的远程推送接受
           UMessage.setAutoAlert(false)
           UMessage.didReceiveRemoteNotification(userInfo)
       }else{
           //应用处于前台时的远程推送接受
       }
       completionHandler([.alert,.sound,.badge])
   }
   
   @available(iOS 10.0, *)
   //iOS10新增：处理后台点击通知的代理方法
   func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
       let userInfo = response.notification.request.content.userInfo
       if (response.notification.request.trigger?.isKind(of: UNPushNotificationTrigger.self))! {
           let info = userInfo as NSDictionary
           print(info)
           //应用处于后台时的远程推送接受
           UMessage.didReceiveRemoteNotification(userInfo)
       }else{
           //应用处于前台时的远程推送接受
       }
   }

   
}
