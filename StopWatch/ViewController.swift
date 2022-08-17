//
//  ViewController.swift
//  StopWatch
//
//  Created by ryo on 2022/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteilabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hanteilabel.isHidden = true //判定ラベル非表示
    }
    
    @objc func up() {
        count += 0.01
        
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        
        hanteilabel.isHidden = false //判定ラベル表示
        
        if (count >= 9.80 && count <= 10.20) {
            hanteilabel.text = "PERFECT!"
        }
        else if (count >= 9.70 && count <= 10.30) {
            hanteilabel.text = "GREAT!"
        }
        else if (count >= 9.50 && count <= 10.50) {
            hanteilabel.text = "GOOD!"
        }
        else {
            hanteilabel.text = "BAD"
        }
    }
    
    @IBAction func start() {
        
        hanteilabel.isHidden = true //判定ラベル非表示
        
        if !timer.isValid {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }

    @IBAction func stop() {
        
        if timer.isValid {
            timer.invalidate()  //タイマー停止
            self.hantei()  //判定メソッド呼び出し
        }
        
    }
    
    @IBAction func reset() {
        
        if timer.isValid {
            timer.invalidate()  //タイマー稼働時はタイマーストップ
            self.hantei()  //判定メソッド呼び出し
        }
        else if !timer.isValid {
            count = 0
            label.text = String(format: "%.2f", count)  //タイマー停止時は初期化
            hanteilabel.isHidden = true //判定ラベル非表示
        }
        
        
        
        
    }
    

}

