//
//  HttpAddressUtil.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/18.
//  Copyright © 2020 jietingzhang. All rights reserved.
//


import Foundation

//网络请求 项目所有用到的 接口
struct BERKKURL {
    
    //测试地址
    public static let Url_Sever = "http://39.101.181.123:8080/bk/rest/"
    
    //网络请求图片地址
    public static let Url_SeverImage = "http://39.101.181.123:8080/bk/"
    
    //验证用户密码
    public static let URL_Login = BERKKURL.Url_Sever + "bkUserController?username=inter&password=123456"
    
    //修改密码
    public static let URL_PassWord = BERKKURL.Url_Sever + "bkUserController?userid=402881fc60a1cbe40160a1f080620011&password=123456&newpassword=123456"
    
    //公司简介列表
    public static let URL_CompanyList = "bkComdecripController"
    
    //行业应用列表
    public static let URL_IndustryList = "bkAppController"
    
    //资质荣誉列表
    public static let URL_QualificationList = "bkHonerController"
    
    //主营业务列表
    public static let URL_MainList = "bkBusController"
    
    //主导技术列表
    public static let URL_DominantList = "bkTecController"
    
    //工程案例列表
    public static let URL_EngineeringList = "bkSampController"
    
    //运营项目
    public static let URL_OperatingList = "bkProgramController"
   
    //取得曲线数据
    public static let URL_Curve = "bkGraphController"
    
    //取得故障信息
    public static let URL_GZtingk = "bkAlertController"
    
    

    
}
