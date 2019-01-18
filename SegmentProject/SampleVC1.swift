//
//  SampleVC1.swift
//  SegmentProject
//
//  Created by ERER on 2019/1/18.
//  Copyright © 2019 ERER. All rights reserved.
//

import UIKit

class SampleVC1: SegmentBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // 子类重写这个方法
    override func selectIndex(index: Int){
        
    }
    
    
    override func addSegmentBar() {
        
        let titles = ["热门", "最新"]
        let vc1 = SampleTableVC()
        let vc2 = SampleTableVC()
        let vcs = [vc1, vc2]
        
        // 添加标题和选择控制器
        segmentBarVC.setupTitlesAndChildVCs(titles: titles, childVCs: vcs)
        segmentBarVC.segmentBar.updateConfig {(config) in
            config.textNormalColor(UIColor.lightGray)
                .textSelectColor(UIColor.black)
                .textNormalFont(UIFont.systemFont(ofSize: 16))
                .barMaxWidth(UIScreen.main.bounds.width - 120)
                .barHeight(44)
                .bottomLineHeight(2)
                .bottomLineColor(UIColor.blue).update()
        }
        
        
        self.navigationItem.titleView = segmentBarVC.segmentBar
        self.addChild(segmentBarVC)
        self.view.addSubview(segmentBarVC.view)
    }

}
