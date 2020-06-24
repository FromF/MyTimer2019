//
//  SettingManager.swift
//  MyTimer
//
//  Created by 藤 治仁 on 2020/06/24.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import UIKit

class SettingManager: NSObject {
    // UIPickerViewに表示するデータをArrayで作成
    let settingArray : [Int] = [10,20,30,40,50,60]
    
    // 設定値を覚えるキーを設定
    private let settingKey = "timer_value"
    
    // タイマーマネージャーのインスタンス取得
    private let timerManager = TimerManager.shared

    // カウントダウン時間
    var timerVaue:Int {
        set(p) {
            // UserDefaultsのインスタンスを生成
            let settings = UserDefaults.standard
            settings.set(p, forKey: settingKey)
            settings.synchronize()

            // タイマー時間をタイマーマネージャーに代入する
            timerManager.timerValue = p
            // タイマーマネージャーにクリア指示して値が変わったことをわかるようにする
            timerManager.clear()
        }
        
        get {
            // UserDefaultsのインスタンスを生成
            let settings = UserDefaults.standard
            return settings.integer(forKey: settingKey)
        }
    }
    
    override init() {
        super.init()
        
        // UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        // UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey:10])
        
        // タイマー時間をタイマーマネージャーに代入する
        timerManager.timerValue = timerVaue
    }

}
