//
//  TimerManager.swift
//  MyTimer
//
//  Created by 藤 治仁 on 2020/06/24.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import UIKit

protocol TimerManagerDelegate: class {
    func timerInterrupt(remainCount:Int)
}

class TimerManager: NSObject {
    ///シングルトン
    static let shared = TimerManager()

    var delegate: TimerManagerDelegate?
    
    // タイマーの変数を作成
    private var timer : Timer?
    // カウント(経過時間)の変数を作成
    private var count = 0
        
    // カウントダウン時間
    var timerValue = 10
    
    // 残り時間(getterを作る)
    var remainCount:Int {
        get {
            return timerValue - count
        }
    }
    
    /// タイマー開始
    func start() {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらスタートしない
            if nowTimer.isValid == true {
                // 何も処理しない
                return
            }
        }
        
        // タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    /// タイマー停止
    func stop() {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら停止
            if nowTimer.isValid == true {
                // タイマー停止
                nowTimer.invalidate()
            }
        }
    }
    
    /// タイマーをクリアする
    func clear() {
        // タイマー停止
        stop()
        // count(経過時間)をリセット
        count = 0
        
        // delegateメソッドを呼び出す
        delegate?.timerInterrupt(remainCount: remainCount)
    }
    
    // 経過時間の処理
    @objc func timerInterrupt(_ timer:Timer) {
        // count(経過時間)に+1していく
        count += 1
        
        // delegateメソッドを呼び出す
        delegate?.timerInterrupt(remainCount: remainCount)
        
        // remainCount(残り時間)が0以下のとき、タイマーを止める
        if remainCount <= 0 {
            // 初期化処理
            count = 0
            // タイマー停止
            timer.invalidate()
        }
    }

}
