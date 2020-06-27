//
//  SettingViewController.swift
//  MyTimer
//
//  Created by Swift-Beginners on 2019/08/24.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    // 設定マネージャーのインスタンス取得
    let settingManager = SettingManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // timerSettingPickerのデリゲートとデータソースの通知先を指定
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        let timerValue = settingManager.timerVaue
        
        // Pickerの選択を合わせる
        for row in 0..<settingManager.settingArray.count {
            if settingManager.settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: Any) {
        // 前画面に戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    // UIPickerViewの列数を設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数を取得
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingManager.settingArray.count
    }
    
    // UIPickerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return String(settingManager.settingArray[row])
    }
    
    // picker選択時に実行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingManager.timerVaue = settingManager.settingArray[row]
    }
    
}
