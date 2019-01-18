//
//  SegmentBar.swift
//  CaiLu
//
//  Created by ERER on 2018/10/30.
//  Copyright © 2018 LX. All rights reserved.
//

import UIKit

protocol SegmentBarDelegate: class {
    func segmentBarDidSelect(segmentBar: SegmentBar, toIndex: NSInteger, fromIndex: NSInteger)
    
}

class SegmentBar: UIView {

    weak var segmentDelegate : SegmentBarDelegate?
    var config : SegmentBarConfig = SegmentBarConfig.defaultConfig()
    var titles = [String]() {
        didSet{
            self.addSegmentItems()
        }
    }

    var itemBtns = [UIButton]()
    
    // 选项item的contentView
    let itemsContentV : UIScrollView = UIScrollView()
    
    // 底部指示线
    let bottomLine : UIView =  UIView()
    
    // 记录上一个选中 按钮选项
    var lastSelectBtn : UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = config.textNormalBackgroudColor
        // 添加
        self.addSubVs()
    }
    
    private func addSubVs(){
        // 添加bottomLine
        itemsContentV.addSubview(bottomLine)
        
        itemsContentV.showsHorizontalScrollIndicator = false
        itemsContentV.showsVerticalScrollIndicator = false
        itemsContentV.bounces = false
        self.addSubview(itemsContentV)
        
        itemsContentV.delegate = self
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 更新选项样式
    func updateConfig(configBlock : ((_ config: SegmentBarConfig) -> ())?){
        if let configBlock = configBlock{
            configBlock(self.config)
        }
        // 按照当前的config进行刷新
        self.updateSegmentItemsStyle()
        
    }
    
    // 添加选项
    private func addSegmentItems() {
        // 删除之前的组件
        for btn in itemBtns {
            btn.removeFromSuperview()
        }
        self.itemBtns.removeAll()
        
        // 根据数据创建 选项button
        for title in titles {
            let btn = UIButton(type: .custom)
            btn.tag = itemBtns.count
            btn.setTitle(title, for: .normal)

            btn.addTarget(self, action: #selector(btnDidClick(btn:)), for: .touchUpInside)
            itemBtns.append(btn)
            itemsContentV.addSubview(btn)
        }
        
    }
    
    // 更新选项卡配置
    func updateSegmentItemsStyle()  {
        // 选项按钮
        for btn in itemBtns {
            btn.setTitleColor(config.textNormalColor, for: .normal)
            btn.setTitleColor(config.textSelectColor, for: .selected)
            btn.titleLabel?.font = config.textNormalFont
        }
        // bottomLine
        bottomLine.frame = CGRect(x: 0, y: config.barHeight - config.bottomLineHeight, width: 10, height: config.bottomLineHeight)
        bottomLine.backgroundColor = config.bottomLineColor
        
        // 计算宽度
        self.itemsContentV.frame = self.bounds
        
        if config.isItemEqualWidth { // 等分宽度
            let count = itemBtns.count
            let width = config.barMaxWidth / CGFloat(count)
            for (i, btn) in itemBtns.enumerated() {
                btn.frame = CGRect(x: CGFloat(i) * width, y: 0, width: width, height:  config.barHeight - config.bottomLineHeight)
            }
            //MARK: - 这里要做进一步约束容错
             self.frame = CGRect(x: 0, y: 0, width: config.barMaxWidth, height: config.barHeight)
            itemsContentV.frame = self.bounds
            itemsContentV.contentSize = CGSize(width: config.barMaxWidth, height: config.barHeight)

            
        }else{ // 不等分--根据每个item的内容自适应宽度
            
            // 计算总宽度
            var totalW : CGFloat = 0
            var x : CGFloat = 0
            
            for btn in itemBtns {
                btn.sizeToFit()
                
                btn.frame = CGRect(x: x + config.leftMargin, y: 0, width: btn.bounds.size.width, height: config.barHeight - config.bottomLineHeight)
                totalW = x + btn.bounds.size.width
                x = totalW + config.itemMarginW
            }
            totalW += config.leftMargin * 2
            
            if totalW < config.barMaxWidth {
                self.frame = CGRect(x: 0, y: 0, width: totalW, height: config.barHeight)
            }else{
                self.frame = CGRect(x: 0, y: 0, width: config.barMaxWidth, height: config.barHeight)
            }
            itemsContentV.frame = self.bounds
            itemsContentV.contentSize = CGSize(width: totalW, height: config.barHeight)
        }
        
        // 期初位置 btn选中
        if itemBtns.count > 0 {
            let btn = itemBtns[0]
            btnDidClick(btn: btn)
        }
        

    }
    
    
    
    
    
    
    
    
    // btn点击事件
    @objc private func btnDidClick(btn: UIButton)  {
        
        if let lastBtn = lastSelectBtn{
            if lastBtn == btn {return}
        }
        
        lastSelectBtn?.titleLabel?.font = config.textNormalFont
        btn.titleLabel?.font = config.textSelectFont
        
        // 传递事件
        self.segmentDelegate?.segmentBarDidSelect(segmentBar: self, toIndex: btn.tag, fromIndex: lastSelectBtn?.tag ?? 0)
        
        // 更改选中样式
        btn.isSelected = true
        lastSelectBtn?.isSelected = false
        lastSelectBtn = btn
        
        // 底部line位置
        UIView.animate(withDuration: 0.1) {
            if self.config.isItemEqualWidth {
                self.bottomLine.bounds.size.width = (btn.titleLabel?.text ?? "").widthWithCurrentFont(btn.titleLabel?.font ?? UIFont())
                
            }else{
                self.bottomLine.bounds.size.width = btn.bounds.width
            }
            self.bottomLine.center = CGPoint(x: btn.center.x, y: self.bottomLine.center.y)
        }
        
        // 判断临界值
        if btn.frame.origin.x < itemsContentV.contentOffset.x {
            itemsContentV.setContentOffset(CGPoint(x: btn.frame.origin.x, y: 0), animated: true)
        }else if btn.frame.origin.x + btn.bounds.width > itemsContentV.contentOffset.x + itemsContentV.bounds.width{
            let offsetX = btn.frame.origin.x + btn.bounds.width - itemsContentV.bounds.width
            itemsContentV.setContentOffset(CGPoint(x: offsetX   , y: 0), animated: true)
        }
    }
    
    // 选中第几个btn
    func setSelectIndex(index : NSInteger) {
        if  itemBtns.count == 0 || itemBtns.count <= index || index < 0 {
            return
        }
        
        let btn = itemBtns[index]
        btnDidClick(btn: btn)
        
    }
    
}


extension SegmentBar : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("scrolOffsetX--\(scrollView.contentOffset.x)")
    }
}



//MARK: - 计算宽度
extension String{
    func widthWithCurrentFont(_ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: font.pointSize)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil)
        return boundingBox.width
    }

}
