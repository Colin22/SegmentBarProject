//
//  SegmentBarConfig.swift
//  CaiLu
//
//  Created by ERER on 2018/10/30.
//  Copyright © 2018 LX. All rights reserved.
//

import UIKit

class SegmentBarConfig: NSObject {
    
    /**默认字体颜色*/
    var textNormalColor = UIColor.lightGray
    /**选中字体颜色*/
    var textSelectColor = UIColor.black
    /**默认字体大小*/
    var textNormalFont = UIFont.systemFont(ofSize: 16)
    /**选中字体大小*/
    var textSelectFont = UIFont.boldSystemFont(ofSize: 16)
    /**默认字体背景*/
    var textNormalBackgroudColor = UIColor.clear
    /**选中字体背景*/
    var textSelectBackgroudColor = UIColor.clear
    /**底部bottomLine颜色*/
    var bottomLineColor = UIColor.blue
    /**底部bottomLine高度*/
    var bottomLineHeight: CGFloat = 3.0
    /**选项之间的间距*/
    var itemMarginW : CGFloat = 30
    /**选项bar最大宽度*/
    var barMaxWidth : CGFloat = UIScreen.main.bounds.width
    /**选项bar高度*/
    var barHeight : CGFloat = 44
    /**每个item是平均宽度*/ // true 平分  false 内容自适应
    var isItemEqualWidth : Bool = false
    /**左边最小的间距*/ // 非平均宽度情况下(isItemEqualWidth==false)第一个按钮离着左边的间距
    var leftMargin : CGFloat = 10
//    /**scrollV是否可以手动拖动*/ //
//    var canScroll : Bool = true
//
    


    

    
    static func defaultConfig() -> SegmentBarConfig{
        let config  = SegmentBarConfig()
        return config
    }
    
    // 自定义配置
    func textNormalColor(_ color : UIColor) -> SegmentBarConfig {
        self.textNormalColor = color
        return self
    }
    func textSelectColor(_ color : UIColor) -> SegmentBarConfig {
        self.textSelectColor = color
        return self
    }
    func textNormalFont(_ font : UIFont) -> SegmentBarConfig {
        self.textNormalFont = font
        return self
    }
    func textSelectFont(_ font : UIFont) -> SegmentBarConfig {
        self.textSelectFont = font
        return self
    }
    func textNormalBackgroudColor(_ color : UIColor) -> SegmentBarConfig {
        self.textNormalBackgroudColor = color
        return self
    }
    func textSelectBackgroudColor(_ color : UIColor) -> SegmentBarConfig {
        self.textSelectBackgroudColor = color
        return self
    }
    func bottomLineColor(_ color : UIColor) -> SegmentBarConfig {
        self.bottomLineColor = color
        return self
    }
    func bottomLineHeight(_ height : CGFloat) -> SegmentBarConfig {
        self.bottomLineHeight = height
        return self
    }
    func itemMarginW(_ margin : CGFloat) -> SegmentBarConfig {
        self.itemMarginW = margin
        return self
    }
    func barMaxWidth(_ width : CGFloat) -> SegmentBarConfig {
        self.barMaxWidth = width
        return self
    }
    func barHeight(_ height : CGFloat) -> SegmentBarConfig {
        self.barHeight = height
        return self
    }
    func isItemEqualWidth(_ isEqual : Bool) -> SegmentBarConfig {
        self.isItemEqualWidth = isEqual
        return self
    }
    func leftMargin(_ margin : CGFloat) -> SegmentBarConfig {
        self.leftMargin = margin
        return self
    }


//    func canScroll(_ canScroll : Bool) -> SegmentBarConfig {
//        self.canScroll = canScroll
//        return self
//    }

    
    
    

    
    func update() {
        
    }
    
    
}
