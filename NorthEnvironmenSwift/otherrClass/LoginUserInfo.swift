//
//  LoginUserInfo.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/21.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

// 登录信息
struct t_LoginInfo_data:Decodable {

    var token:String? = nil//
    var id:String? = nil//
    var userNm:String? = nil//
    var phn:String? = nil//
    var deviceId:String? = nil//设备deviceId
}

extension UserDefaults {
    enum LoginInfo: String {

        case token//token
        case id//id
        case userNm//username
        case phn//电话
        case deviceId // 设备deviceId
    }
    
    //存数据
    static func set(value: String, forKey key: LoginInfo) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }

    //取数据
    static func string(forKey key: LoginInfo) -> String? {
        let key = key.rawValue
        return UserDefaults.standard.string(forKey: key)
    }
}
