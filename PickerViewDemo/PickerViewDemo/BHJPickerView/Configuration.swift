//
//  Configuration.swift
//  BHJPickerView
//
//  Created by 白华君 on 2018/5/21.
//  Copyright © 2018年 baihuajun. All rights reserved.
//

/// 工程配置文件
import UIKit

/// 屏幕宽
let kScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高
let kScreenHeight = UIScreen.main.bounds.size.height
/// 宽度比
let kScalWidth = (kScreenWidth / 375)
/// 高度比
let kScalHeight = (kScreenHeight / 667)






/// RGB颜色
func kRGBColor(_ r:CGFloat,_ g : CGFloat, _ b : CGFloat, _ p : CGFloat) -> UIColor {
    
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: p)
}

let kPrintLog = 1  // 控制台输出开关 1：打开   0：关闭
// 控制台打印
func PLog(item: Any...) {
    if kPrintLog == 1 {
        print(item.last!)
    }
}
