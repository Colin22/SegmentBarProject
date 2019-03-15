//
//  SegmentBarVC.swift
//  CaiLu
//
//  Created by ERER on 2018/10/30.
//  Copyright © 2018 LX. All rights reserved.
//

import UIKit

class SegmentBarVC: UIViewController {
    
    let segmentBar = SegmentBar(frame: CGRect(x: 0, y: 0, width: 100, height: 44))

    // contentV
    var contentV : UIScrollView =  UIScrollView()
    
    var selectBlock: ((_ index: Int)->())?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加内容滚动scrollV
        addContentV()
        
    }
    
    // 添加内容滚动scrollV
    private func addContentV(){
        segmentBar.segmentDelegate = self
        contentV.backgroundColor = UIColor.lightGray
        contentV.delegate = self
        contentV.isPagingEnabled = true
        contentV.bounces = false
        contentV.delaysContentTouches = false
        view.addSubview(contentV)
    }
    
    // 添加标题和选择控制器
    func setupTitlesAndChildVCs(titles: [String], childVCs: [UIViewController]) {
        assert(titles.count != 0 || titles.count != childVCs.count, "个数有问题")
        segmentBar.titles = titles
        for vc in childVCs {
            self.addChild(vc)
        }
        // 添加子view
        self.addChildViews()
        self.contentV.contentSize = CGSize(width: view.bounds.size.width * CGFloat(titles.count), height: 0)
    }
    
    // 添加子view
    private func addChildViews(){
        for subVC in self.children {
            subVC.view.frame = CGRect.zero
            self.contentV.addSubview(subVC.view)
        }
    }
    
    // 布局子view
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        contentV.frame = view.bounds
        
        var index : CGFloat = 0
        for subVC in self.children {
            subVC.view.frame = CGRect(x: index * self.contentV.bounds.size.width, y: 0, width: self.contentV.bounds.size.width, height: self.contentV.bounds.size.height)
            index = index + 1
        }

        
    }
}

extension SegmentBarVC : SegmentBarDelegate, UIScrollViewDelegate{
    
    func segmentBarDidSelect(segmentBar: SegmentBar, toIndex: NSInteger, fromIndex: NSInteger) {
        contentV.setContentOffset(CGPoint(x: CGFloat(toIndex) * self.contentV.bounds.size.width, y: self.contentV.contentOffset.y), animated: true)
        selectBlock?(toIndex)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = contentV.contentOffset.x / contentV.bounds.size.width
        // 切换
        segmentBar.setSelectIndex(index: NSInteger(index) )
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = contentV.contentOffset.x / contentV.bounds.size.width
        segmentBar.setScrollValue(value: value)
    }

}
