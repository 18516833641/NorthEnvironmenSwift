//
//  HttpsRequest.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/21.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum RequestType {
    case Get
    
    case Post
    
    case Put
    
    case Delete
}

typealias complete = (Error?,Data?)->Void


class BKHttpTool {

    static let shareInstance:BKHttpTool = {
        
        let tools = BKHttpTool()
        return tools
    }()
}

extension BKHttpTool {
    
    static func requestData(requestType : RequestType,URLString : String,parameters : [String:Any]? ,headers: HTTPHeaders? = nil, successed : @escaping complete,failured:@escaping complete){
        
        //获取请求类型
        var method : HTTPMethod?
        
        switch requestType {
        case .Get:
            method = HTTPMethod.get
        case .Post:
            method = HTTPMethod.post
        case .Put:
            method = HTTPMethod.put
        case .Delete:
            method = HTTPMethod.delete
            
        }
       
//        
//        let headers:HTTPHeaders = [
//            "token"     : "token",
//        ]
        
        //发送网络请求responseJSON
        AF.request(URLString, method: method!, parameters: parameters, headers: headers).responseJSON { (response) in
            //获取返回结果
//            let res = response
            
            switch response.result {
            case .success:
                
                let json = JSON(response.value as Any)
                
//                getTestPrint(response.data)
//                print("-------:\(json)")
                successed(nil, response.data)
                
            case .failure:

                failured(response.error, nil)
            }
            
        }
    }
    
    static func getTestPrint(_ data:Data?){
        do{
            guard let info:Data = data else {
                print("未获取数据")
                return
            }
            
            let dataDic = try JSONSerialization.jsonObject(with:info, options: .mutableLeaves) as! [String:Any]
            print("请求数据----\(dataDic)")
            
        }catch _ as Any {
            
            print("没有获取数据")
        }
    }
    
    
}




extension Data {
    /// json data 转模型
    /// 可以直接拿网络请求成功的response直接转换
    func jsonDataMapModel<T:Decodable>(_ type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            print("---解析失败\(self)")
            return nil
        }
    }
    

    func DataToJSONObject(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data , options: .mutableContainers) as AnyObject;
        } catch {
            print(error);
        }
        return nil;
    }

}

extension Dictionary {
    
    func dataToDictionary(data:Data) ->Dictionary<String, Any>?{

        do{

            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

            let dic = json as! Dictionary<String, Any>

            return dic

        }catch _ {

            print("失败")

            return nil

        }

    }
   
}

    

extension String {
    /// json字符串转模型
    func jsonStringMapModel<T:Decodable>(_ type: T.Type) -> T? {

        if let jsonData = self.data(using: .utf8) {
            return jsonData.jsonDataMapModel(T.self)
        }
        print("解析失败\(self)")
        return nil
    }
}
