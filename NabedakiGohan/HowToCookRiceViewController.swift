//
//  HowToCookRiceViewController.swift
//  NabedakiGohan
//
//  Created by えばた あや on 2016/10/14.
//  Copyright © 2016年 えばた あや. All rights reserved.
//

import UIKit

class HowToCookRiceViewController: UIViewController {

    var riceTimer = Timer()
    let riceTimeUserDefaults = UserDefaults.standard
    
    var waterTime: Int = 0
    var lowHeatTime: Int = 0
    var addTime: Int = 5  // テスト用 60
    
    @IBOutlet weak var waterTimeLabel: UILabel!
    @IBOutlet weak var lowHeatTimeLabel: UILabel!
    @IBOutlet weak var addTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUserDefaults()
    }
    
    func initUserDefaults() {
        waterTime = riceTimeUserDefaults.integer(forKey: "waterTime")
        lowHeatTime = riceTimeUserDefaults.integer(forKey: "lowHeatTime")

        // テスト用
        waterTime = 5
        lowHeatTime = 5

        waterTimeLabel.text = timerString(time: waterTime)
        lowHeatTimeLabel.text = timerString(time: lowHeatTime)
    }
    
    @IBAction func washButtonClicked() {
        alert(type: "wash", message: "水に浸してね！")
    }

    @IBAction func boilButtonClicked() {
        alert(type: "boil", message: "弱火にしてね！")
    }
    
    @IBAction func withWaterButtonClicked() {
        alert(type: "withWater", message: "追加で弱火にかけてね！")
    }

    @IBAction func withoutWaterButtonClicked() {
        alert(type: "withoutWater", message: "強火にしてね！")
    }
    
    func alert(type: String, message: String) {
        let alert = UIAlertController(title: "つぎのこうてい", message: message, preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "次へ", style: .default, handler: {(action:UIAlertAction!) -> Void in
            self.alertAction(type: type)
        })
        alert.addAction(nextAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertAction(type: String) {
        switch type {
        case "wash":
            setRiceTimer(selector: #selector(waterTimerUpdate))
        case "boil":
            setRiceTimer(selector: #selector(lowHeatTimerUpdate))
        case "withWater":
            setRiceTimer(selector: #selector(addTimerUpdate))
        case "withoutWater":
            setRiceTimer(selector: #selector(highHeatTimerUpdate))
        default:
            break
        }
    }

    func setRiceTimer(selector: Selector) {
        riceTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: selector, userInfo: nil, repeats: true)
    }

    func waterTimerUpdate(timer: Timer) {
        waterTime -= 1
        waterTimeLabel.text = timerString(time: waterTime)
        
        if waterTime == 0 {
            riceTimer.invalidate()
            alert(type: "water", message: "中火にして沸騰してね！")
        }
    }
    
    func lowHeatTimerUpdate(timer: Timer) {
        lowHeatTime -= 1
        lowHeatTimeLabel.text = timerString(time: lowHeatTime)
        
        if lowHeatTime == 0 {
            riceTimer.invalidate()
            alert(type: "lowHeat", message: "水分が残ってないか確認してね！")
        }
    }
    
    func addTimerUpdate() {
        addTime -= 1
        addTimeLabel.text = timerString(time: addTime)
        
        if addTime == 0 {
            riceTimer.invalidate()
            alert(type: "add", message: "水分が残ってないか確認してね！")
        }
    }
    
    func highHeatTimerUpdate() {
        // highHeatTimer action
    }
    
    func timerString(time: Int) -> String {
        return "\(String(format: "%02d", Int(floor(Double(time/60))))):\(String(format: "%02d", time%60))"
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if riceTimer.isValid == true {
            riceTimer.invalidate()
        }
    }
    
}
