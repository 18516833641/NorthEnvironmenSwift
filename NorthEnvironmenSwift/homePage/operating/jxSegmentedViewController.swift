//
//  jxSegmentedViewController.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit
//import JXSegmentedView

class jxSegmentedViewController: AnalyticsViewController {
    
    var listId = ""
    var project = ""
    
    

    @IBOutlet weak var segmentedView: JXSegmentedView!
    var segmentedDataSource: JXSegmentedTitleDataSource!
    var listContainerView: JXSegmentedListContainerView!
    
    let oneVc = operatingOneViewController()
    let Twovc = operatingTwoViewController()
    let Threevc = operatingThreeViewController()
    let fourvc = operatingFourViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSegmentedView()
        // Do any additional setup after loading the view.
        
        print("-------+++++++++++++++\(listId)")
    }
    //MARK:设置轮播
        func setupSegmentedView()  {
        
        //渐变色
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = segmentedView.bounds
//        self.view.layer.addSublayer(gradientLayer)
//
////        let startColor = UIColor(red: 106/255.0, green: 227/255.0, blue: 233/255.0, alpha: 0.67).cgColor
////        let endColor = UIColor(red: 252/255.0, green: 252/255.0, blue: 252/255.0, alpha: 0.67).cgColor
//            let startColor = UIColor(red: 0/255.0, green: 241/255.0, blue: 254/255.0, alpha: 0.67).cgColor
//            let endColor = UIColor(red: 33/255.0, green: 66/255.0, blue: 81/255.0, alpha: 0.67).cgColor
//        gradientLayer.colors = [startColor, endColor]
//            let gradientLocations:[NSNumber] = [0.5,1]
//        gradientLayer.locations = gradientLocations
//        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        
        //添加在控制器View上的子视图被Layer层绘图覆盖.
//        segmentedView.layer.zPosition = 0
//        self.view.layer.zPosition = 3
//        self.view.layer.addSublayer(segmentedView.layer)
//        self.segmentedView.bringSubviewToFront(personBut)
        
        //1、初始化JXSegmentedView
//        segmentedView = JXSegmentedView()
        
        //2、配置数据源
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = ["项目简介","工艺流程","历史曲线","故障信息"]
        segmentedDataSource.titleNormalFont = UIFont.systemFont(ofSize: 15)
        segmentedDataSource.titleNormalColor = UIColor(red: 26/255.0, green: 35/255.0, blue: 49/255.0, alpha: 1)
//      segmentedDataSource.titleNormalColor = UIColor(red: 19/255.0, green: 134/255.0, blue: 139/255.0, alpha: 1)
            
        segmentedDataSource.titleSelectedColor = UIColor(red: 40/255.0, green: 243/255.0, blue: 253/255.0, alpha: 1)
        //title的颜色是否渐变过渡
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        //当collectionView.contentSize.width小于JXSegmentedView的宽度时，是否将itemSpacing均分。
        segmentedDataSource.isItemSpacingAverageEnabled = true
        // title是否缩放。使用该效果时，务必保证titleNormalFont和titleSelectedFont值相同。
        segmentedDataSource.isTitleZoomEnabled = true
//        sTitleZoomEnabled为true才生效。是对字号的缩放，比如titleNormalFont的pointSize为10，放大之后字号就是10*1.2=12。
        segmentedDataSource.titleSelectedZoomScale = 1.5
        
        
        

        
        //3、配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension - JXSegmentedViewAutomaticDimension + 12
        indicator.lineStyle = .lengthen
        indicator.indicatorColor = .white
        segmentedView.indicators = [indicator]
        
        //5、初始化JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        view.addSubview(listContainerView)
        
        segmentedView.dataSource = segmentedDataSource
        segmentedView.delegate = self
//        segmentView.backgroundColor =
        //6、将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.listContainer = listContainerView

        
        if isiPhoneXScreen() {
            
            //IPhone状态栏高44 导航栏高44 tabbabr高度49 虚拟Home高度34
            listContainerView.frame = CGRect(x: 0, y: segmentedView.frame.maxY - 35, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height - segmentedView.frame.maxY - 40 - 49 )
            
        }else if isiPhonePluscreen(){
            
            listContainerView.frame = CGRect(x: 0, y: segmentedView.frame.maxY + 15, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentedView.frame.maxY-49-15)
            
        }else{
            
            listContainerView.frame = CGRect(x: 0, y: segmentedView.frame.maxY - 35, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentedView.frame.maxY-49-15)
            
        }
        self.view.addSubview(listContainerView)
        
        segmentedView.contentScrollView = listContainerView.scrollView
    }

}


extension jxSegmentedViewController:JXSegmentedViewDelegate,JXSegmentedListContainerViewDataSource {
    
    //返回list的数量
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return segmentedDataSource.titles.count
    }
    
    //遵从JXSegmentedListContainerViewListDelegate协议的实例
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
//       print("=====\(index)")
        switch index {
        case 0:
            //项目简介
            oneVc.url = listId
            return oneVc
          
        case 1:
            //工艺流程
//            Relatedvc.detailsData = videoData
//            Relatedvc.videodataSource = videoDeatilsData1//
            Twovc.url = project
            return Twovc
        case 2:
        //历史曲线
        //            Relatedvc.detailsData = videoData
        //            Relatedvc.videodataSource = videoDeatilsData1//
            Threevc.url = project
            return Threevc
            
        default:
            //故障信息
//            Commentsvc.currentDynamic = videoData
            fourvc.url = project
            return fourvc
        }
        
//        return Recommendedvc
    }
    
    //点击选中的情况才调用的方法
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        listContainerView.didClickSelectedItem(at: index)
        
//        isShowViewOrNoShow = !isShowViewOrNoShow
//
//        if isShowViewOrNoShow {
//            listContainerView.frame = CGRect(x: 0, y: segmentView.frame.maxY + 20, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentView.frame.maxY)
//        }else{
//            listContainerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentView.frame.maxY-UIScreen.main.bounds.height/2+20)
//        }
        
//        switch index {
//        case 0:
//            listContainerView.frame = CGRect(x: 0, y: 264, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentView.frame.maxY-264)
//        case 1:
//            listContainerView.frame = CGRect(x: 0, y: 264, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentView.frame.maxY-264)
//        case 2:
//            listContainerView.frame = CGRect(x: 0, y: 264, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-segmentView.frame.maxY-264)
//        default:
//            break
//        }
        
        
    }
    
    //正在滚动中的回调
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
//
    }
    
}
