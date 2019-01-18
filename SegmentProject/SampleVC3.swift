//
//  SampleVC3.swift
//  SegmentProject
//
//  Created by ERER on 2019/1/18.
//  Copyright © 2019 ERER. All rights reserved.
//

import UIKit

class SampleVC3: SegmentBaseVC {

    //MARK: - 子控件视图
    let topBarV = UIView()
    let contentContainerV = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "SampleVC 3"
        view.backgroundColor = UIColor.white
    }
    
    
    
    
    // 子类重写这个方法
    override func selectIndex(index: Int){
        
    }
    
    
    override func addSegmentBar() {
        
        var vcs = [SampleTableVC]()
        var titles = [String]()
        for _ in 0...7 {
            vcs.append(SampleTableVC())
        }
        for _ in 0...3 {
            titles.append("新闻")
            titles.append("体育频道")
        }
        
        
        // 添加标题和选择控制器
        segmentBarVC.setupTitlesAndChildVCs(titles: titles, childVCs: vcs)
        segmentBarVC.segmentBar.updateConfig {(config) in
            config.textNormalColor(UIColor.lightGray)
                .textSelectColor(UIColor.blue)
                .textNormalFont(UIFont.systemFont(ofSize: 16))
                .textSelectFont(UIFont.boldSystemFont(ofSize: 16))
                .barMaxWidth(UIScreen.main.bounds.width)
                .barHeight(44)
                .itemMarginW(30)
                .leftMargin(20)
                .bottomLineHeight(2)
                .bottomLineColor(UIColor.blue)
                .isItemEqualWidth(false)
                .update()
            
        }
        
        addContainerV()
        
        self.topBarV.addSubview(segmentBarVC.segmentBar)
        self.addChild(segmentBarVC)
        segmentBarVC.view.frame = contentContainerV.bounds
        self.contentContainerV.addSubview(segmentBarVC.view)
        
    }
    
    
    
    
    private func addContainerV(){
        
        topBarV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        topBarV.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        view.addSubview(topBarV)
        
        contentContainerV.frame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: view.bounds.height - 44 - kNaviBarHeight)
        view.addSubview(contentContainerV)
        
        
    }

}
