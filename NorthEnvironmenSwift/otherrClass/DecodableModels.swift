//
//  DecodableModels.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/21.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

/// 转换成数组模型
struct t_success_Login<T:Decodable>: Decodable {
    /// 状态值
//    var success:Int? = nil
//    /// 提示信息
//    var msg:String? = nil
//    /// 时间戳
//    var time:String? = nil
    /// 嵌套模型
    var attributes:T? = nil
}

/// 转换成数组模型
struct t_success_data<T:Decodable>: Decodable {
    // 状态值
//    var ok:Int? = nil
    //
    var message:String? = nil
    //
    var respCode:String? = nil
    // 嵌套模型
    var data:[T]? = nil
}

//公司简介
struct t_company_data:Decodable {

     var content:String? = nil
     var tile:String? = nil//标题
     var updateDate:String? = nil
     var thmb:String? = nil//image
     var id:String? = nil//id
//     var userinfo:UserInfo_data? = nil//人脸图像
}

//故障信息
struct t_fault_data:Decodable {

     var alertvalue:String? = nil//
     var create_date:String? = nil//
     var itemid:String? = nil//
     var itemnm:String? = nil//
     var normlvalue:String? = nil//
     var update_date:String? = nil//
    
}
