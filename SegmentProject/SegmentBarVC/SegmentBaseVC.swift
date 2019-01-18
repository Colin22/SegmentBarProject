//
//  SegmentBaseVC.swift
//  CaiLu
//
//  Created by ERER on 2018/10/30.
//  Copyright © 2018 LX. All rights reserved.
//

import UIKit

class SegmentBaseVC: UIViewController {
    
    let segmentBarVC : SegmentBarVC = SegmentBarVC()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 导航栏中部 选择
        addSegmentBar()
        
        segmentBarVC.selectBlock = { [weak self] (index) in
            self?.selectIndex(index: index)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isTranslucent = false
    }
    
    // 子类重写这个方法
    public func selectIndex(index: Int){}
    
    
    public func addSegmentBar() {
        
        let titles = ["热门", "最新"]
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.lightGray
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue

        let vcs = [vc1, vc2]
        
        self.navigationItem.titleView = segmentBarVC.segmentBar
        self.addChild(segmentBarVC)
        self.view.addSubview(segmentBarVC.view)
        
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
    }
    
    deinit {
        debugPrint("segmentBaseVC 释放了")
    }
}
