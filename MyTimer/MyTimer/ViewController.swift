//
//  ViewController.swift
//  MyTimer
//
//  Created by Swift-Beginners on 2019/08/24.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController , TimerManagerDelegate {
    
    // タイマーマネージャーのインスタンス取得
    let timerManager = TimerManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // タイマーマネージャーにインスタンスを設定
        timerManager.delegate = self
        // タイマークリアする
        timerManager.clear()
    }

    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtonAction(_ sender: Any) {
        // タイマー停止
        timerManager.stop()
    }
 
    @IBAction func startButtonAction(_ sender: Any) {
        // タイマー開始
        timerManager.start()
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        // タイマー停止
        timerManager.stop()
    }
    
    // タイマーマネージャーのdelegateメソッド
    func timerInterrupt(remainCount: Int) {
        // remainCount(残りの時間)をラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"

        // remainCount(残り時間)が0以下のとき、タイマーを止める
        if remainCount <= 0 {
            // カスタマイズ編：ダイアログを作成
            let alertController = UIAlertController(title: "終了", message: "タイマー終了時間です", preferredStyle: .alert)
            // ダイアログに表示させるOKボタンを作成
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            // アクションを追加
            alertController.addAction(defaultAction)
            // ダイアログの表示
            present(alertController, animated: true, completion: nil)
        }
    }
    
    // 画面切り替えのタイミングで処理を行なう
    override func viewDidAppear(_ animated: Bool) {
        // タイマークリアする
        timerManager.clear()
    }
    
}

