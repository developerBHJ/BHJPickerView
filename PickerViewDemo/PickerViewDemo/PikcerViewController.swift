//
//  PikcerViewController.swift
//  BHJPickerView
//
//  Created by 白华君 on 2018/5/21.
//  Copyright © 2018年 baihuajun. All rights reserved.
//

import UIKit

let cell_ID = "cell"


class PikcerViewController: UIViewController,PickerDelegate {
    
    var titleArray = ["城市选择","日期选择","性别选择"]
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "城市、日期、性别选择"
        self.view.addSubview(self.pikerTableView)
        
    }
    
    //MARK: - Lazy
    lazy var pikerTableView: UITableView = {
        let tempPikerTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.plain)
        tempPikerTableView.delegate = self
        tempPikerTableView.dataSource = self
        tempPikerTableView.register(UITableViewCell.self, forCellReuseIdentifier: cell_ID)
        return tempPikerTableView
    }()
    
    //MARK: - Fuction
    
    
    //MARK:- didReceiveMemoryWarning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - Delegate
extension PikcerViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_ID, for: indexPath)
        cell.textLabel?.text = self.titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        switch row {
        case 1:
            let pickerView = BHJPickerView.init(self, .date)
            pickerView.pickerViewShow()
        case 2:
            let pickerView = BHJPickerView.init(self, .gender)
            pickerView.pickerViewShow()
        default:
            let pickerView = BHJPickerView.init(self, .address)
            pickerView.pickerViewShow()
        }
    }
    
    //MARK: - PickerDelegate
    func selectedAddress(_ pickerView: BHJPickerView, _ procince: AddressModel, _ city: AddressModel, _ area: AddressModel) {
        
        let messge = procince.region_name! + city.region_name! + area.region_name!
        self.alertStr(messge)
    }
    
    func selectedGender(_ pickerView: BHJPickerView, _ genderStr: String) {
        
        let messge = genderStr
        self.alertStr(messge)
    }
    
    func selectedDate(_ pickerView: BHJPickerView, _ dateStr: Date) {
        
        let messge = Date().dateStringWithDate(dateStr)
        self.alertStr(messge)
    }
    
    /// 提示
    ///
    /// - Parameter str: 提示语
    func alertStr(_ str : String) {
        let alertController = UIAlertController(title: "提示", message: str,preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction1 = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil)
        let cancelAction2 = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(cancelAction1)
        alertController.addAction(cancelAction2)
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
}


