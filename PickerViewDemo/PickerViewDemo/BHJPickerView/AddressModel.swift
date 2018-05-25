//
//  AddressModel.swift
//  BHJPickerView
//
//  Created by 白华君 on 2018/5/23.
//  Copyright © 2018年 baihuajun. All rights reserved.
//

import UIKit

class AddressModel: NSObject {
    
    var region_name : String?
    var region_type : String?
    var agency_id : String?
    var region_id : String?
    var parent_id : String?
    var childs : [NSDictionary]?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        PLog(item: key)
    }
}
