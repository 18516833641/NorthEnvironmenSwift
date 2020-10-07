//
//  operatingThreeDetaileController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/27.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import SwiftyJSON

class operatingThreeDetaileController: AnalyticsViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ChartView: LineChartView!
    
    var projrctStr = ""
    var typeStr = "0"
    
    var pushUrl = ""
    
    
    var xStr = ["1", "2", "3", "4","5","6","7","8","9"] //x轴类别项
    var values = [98.0, 70.3, 40.1, 18.2, 40.2, 20.1, 30, 50, 120] //x轴对应的y轴数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpService()
        
        ChartView.delegate = self
        
        ChartView.noDataText = "暂无统计数据"//无数据展示
        ChartView.noDataTextColor = .white
        ChartView.chartDescription?.enabled = false // 是否显示描述
        
        
        
        ChartView.scaleXEnabled = false
        ChartView.scaleYEnabled = false
        ChartView.leftAxis.drawGridLinesEnabled = true //左侧y轴设置，不画线
        ChartView.rightAxis.drawGridLinesEnabled = true //右侧y轴设置，不画线
        ChartView.rightAxis.enabled = false
        ChartView.legend.enabled = false
        
        ChartView.xAxis.labelTextColor = UIColor(red: 40/255.0, green: 243/255.0, blue: 253/255.0, alpha: 1)
        ChartView.leftAxis.labelTextColor = UIColor(red: 40/255.0, green: 243/255.0, blue: 253/255.0, alpha: 1)
        
        setLineChartViewData(xStr, values)
        
    }
    
    //配置折线图
       func setLineChartViewData(_ dataPoints: [String], _ values: [Double]) {
           
           let xAxis = ChartView.xAxis
           xAxis.labelPosition = .bottom //x轴的位置
           xAxis.labelFont = .systemFont(ofSize: 12)
           xAxis.drawGridLinesEnabled = false
           xAxis.granularity = 1.0
           xAxis.valueFormatter = self
           
           var dataEntris: [ChartDataEntry] = []
           for (idx, _) in dataPoints.enumerated() {
               let dataEntry = ChartDataEntry(x: Double(idx), y: values[idx])
               dataEntris.append(dataEntry)
           }
        
           let lineChartDataSet = LineChartDataSet(entries: dataEntris, label: "")
           //外圈
           lineChartDataSet.setCircleColor(.clear)
           //内圈
           lineChartDataSet.circleHoleColor = .green
           //线条显示样式
           lineChartDataSet.colors = [UIColor(red: 40/255.0, green: 243/255.0, blue: 253/255.0, alpha: 1)]
        
        lineChartDataSet.valueTextColor = .white
        
           lineChartDataSet.valueFont = .systemFont(ofSize: 12)
           
           let lineChartData = LineChartData(dataSet: lineChartDataSet)
           ChartView.data = lineChartData
           
           //设置x轴样式
           let xFormatter = IndexAxisValueFormatter()
           xFormatter.values = dataPoints
           
           self.ChartView.animate(xAxisDuration: 1)
       }

    @IBAction func timeAction(_ sender: Any) {
        
        Dialog()
        
        .wTypeSet()(DialogTypePop)
        //弹出动画
        .wShowAnimationSet()(AninatonZoomIn)
            
        //消失动画
        .wHideAnimationSet()(AninatonZoomOut)
            
        //全部圆角 用法和系统的UIRectCorner相同
        .wPopViewRectCornerSet()(DialogRectCorner.allCorners)
            
        //弹出位置
        .wDirectionSet()(DiaDirection.directionDowm)
            
        //数据
        .wDataSet()([
            ["name":"日"],
            ["name":"周"],
            ["name":"月"],
                     ])
        
            
        .wEventFinishSet()(){ anyId, path,type  in
         
            self.xStr = []
            self.values = [0.0]
            self.setLineChartViewData(self.xStr, self.values)
        }
        
            
        .wTapViewSet()(sender as! UIView)
        .wStart()
        
        
        
    }
    
    @IBAction func listAction(_ sender: Any) {
        
        let vc = operatingSixDetaileController()
        vc.title = "数据记录表"
        vc.url = pushUrl
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
     func httpService() {
                    
                   let token = UserDefaults.string(forKey: .token)
                    
                   let headers:HTTPHeaders = [
                            "X-AUTH-TOKEN" : token!,
                        ]
            
                    print("\(BERKKURL.Url_Sever + BERKKURL.URL_GZtingk + "/" + projrctStr + "&" + typeStr)")
                    BKHttpTool.requestData(requestType: .Get, URLString: BERKKURL.Url_Sever + BERKKURL.URL_Curve + "/" + projrctStr + "&" + typeStr, parameters: nil, headers: headers, successed: { (error, response) in
                        
                        if error == nil , let data = response{
                            
                            
                            print("\(JSON(data))")
                            let json = JSON(data)

                            self.xStr = [json["data"]["dt"].stringValue]
                            self.values = [json["data"]["tjrc"].doubleValue]
                            
                            print("-----\(self.xStr )")
                            print("------\(self.values )")
//                            let model = data.jsonDataMapModel(t_success_data<t_fault_data>.self)
//
//    //                        print("==============\(String(describing: model))")
//                            guard let dataList = model?.data,error == nil else {
//
//    //                            self.noData.image = UIImage(named: "sever_error")
//    //                            self.noData.isHidden = false
//                                return
//                            }

//                            for cellData in dataList {
//                               self.dataSource.append(cellData)
//                           }
//                             self.tableView.reloadData()
                        }
                        
                    }) { (error, nil) in
                        SVProgressHUD.showError(withStatus: "\(String(describing: error))")
                        SVProgressHUD.dismiss(withDelay: 1)
                        print("======\(String(describing: error))")
                    }
                    
            }
}


//注意：这里是签订一个类似于x轴样式的代理，显示需要的自定义字符串
//在扩展里实现
extension operatingThreeDetaileController: IAxisValueFormatter,ChartViewDelegate {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return xStr[Int(value) % xStr.count]
    }
}
