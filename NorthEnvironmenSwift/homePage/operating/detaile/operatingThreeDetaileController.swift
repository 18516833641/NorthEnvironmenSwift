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
    
    @IBOutlet weak var timeView: UIView!
    
    @IBOutlet weak var timeButton: UIButton!
    
    var isSelect = true
    
    
    var projrctStr = ""
    var typeStr = "0"
    
    var pushUrl = ""
    
    var titleStr = ""//label文字
    
    
    
    var xStr:[String] = [] //x轴类别项
    var values:[Double] = [] //x轴对应的y轴数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleStr
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
        
        
        let maskPath = UIBezierPath(roundedRect: timeView.bounds,byRoundingCorners:[.topLeft,.topRight,.bottomLeft,.bottomRight],cornerRadii: CGSize(width: 15,height: 15))

        let maskLayer = CAShapeLayer()

        maskLayer.frame = timeView.bounds

        maskLayer.path = maskPath.cgPath

        timeView.layer.mask = maskLayer
        
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
    
    //日
    @IBAction func dayAction(_ sender: Any) {
        
        xStr.removeAll()
        values.removeAll()
        typeStr = "0"
        httpService()
        isSelect = false
        timeView.isHidden = true
        timeButton.setTitle("日", for: .normal)
    }
    
    //周
    @IBAction func weekAction(_ sender: Any) {
        
        xStr.removeAll()
        values.removeAll()
        typeStr = "1"
        httpService()
        isSelect = false
        timeView.isHidden = true
        timeButton.setTitle("周", for: .normal)
    }
    
    //月
    @IBAction func monthAction(_ sender: Any) {
        
        xStr.removeAll()
        values.removeAll()
        typeStr = "2"
        httpService()
        isSelect = false
        timeView.isHidden = true
        timeButton.setTitle("月", for: .normal)
    }
    
    //弹框按钮
    @IBAction func timeAction(_ sender: Any) {

        isSelect = !isSelect
        
        if isSelect {
            timeView.isHidden = true
        }else{
            timeView.isHidden = false
        }
        
        
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
                       
                            let model = data.jsonDataMapModel(t_success_data<t_qx_data>.self)
                            
                            guard let dataList = model?.data,error == nil else {
                                return
                            }

                            for cellData in dataList {
                                
//                                if cellData.dt!.isEmpty {
//
//                                    return
//                                }
//                                if cellData.tjrc!.isEmpty {
//
//                                    return
//                                }
                                self.xStr.append(cellData.dt ?? "")
                                self.values.append(Double(cellData.tjrc ?? "")!)
                            }
                            
                            self.setLineChartViewData(self.xStr, self.values)

                        }
                        
                    }) { (error, nil) in
                        SVProgressHUD.showError(withStatus: "登录已失效")
                        SVProgressHUD.dismiss(withDelay: 0.75)
                        let vc = loginViewController()
                        self.view.window?.rootViewController = vc
                        self.view.window?.backgroundColor = .white
                        self.view.window?.makeKeyAndVisible()
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
