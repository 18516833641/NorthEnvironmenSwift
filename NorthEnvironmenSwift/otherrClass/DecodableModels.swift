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


//struct UserInfo_data : Decodable{
////    var faceimage:String? = nil//人脸图像
////    var invitecode:String? = nil//邀请码
//    var profession:String? = nil//职业
//    var username:String? = nil//
//    var score:Int//分数
//    var gender:Int//性别
//    var level:Int//登记
//    var money:String? = nil//金币
//    var hometown:String? = nil//家乡
//    var mobile:String? = nil//手机号
//    var birthday:String? = nil//生日
//    var nickname:String? = nil//昵称
//    var school:String? = nil//学校
//    var token:String? = nil//token
//}
