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
    
    var waterTime = 0
    var lowHeatTime = 0
    var addTime = 60
    var highHeatTime = 0
    var steamTime = 0
    
    @IBOutlet weak var waterTimeLabel: UILabel!
    @IBOutlet weak var lowHeatTimeLabel: UILabel!
    @IBOutlet weak var addTimeLabel: UILabel!
    @IBOutlet weak var highHeatTimeLabel: UILabel!
    @IBOutlet weak var steamTimeLabel: UILabel!
    
    @IBOutlet weak var washLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var  boilLabel: UILabel!
    @IBOutlet weak var lowHeatLabel: UILabel!
    @IBOutlet weak var waterConfirmationLabel: UILabel!
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var highHeatLabel: UILabel!
    @IBOutlet weak var steamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRiceTimeUserDefaults()
    }
    
    func setRiceTimeUserDefaults() {
        waterTime = riceTimeUserDefaults.integer(forKey: "waterTime")
        lowHeatTime = riceTimeUserDefaults.integer(forKey: "lowHeatTime")
        highHeatTime = riceTimeUserDefaults.integer(forKey: "highHeatTime")
        steamTime = riceTimeUserDefaults.integer(forKey: "steamTime")
        
        waterTimeLabel.text = timerString(time: waterTime)
        lowHeatTimeLabel.text = timerString(time: lowHeatTime)
        highHeatTimeLabel.text = timerString(time: highHeatTime)
        steamTimeLabel.text = timerString(time: steamTime)
    }
    @IBAction func startButtonClicked() {
        firstAlert()
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

    func firstAlert() {
        let alert = UIAlertController(title: "さいしょのこうてい", message: "米を研いでね！", preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "次へ", style: .default, handler: {(action:UIAlertAction!) -> Void in
            self.changeColor(label: self.washLabel)
        })
        alert.addAction(nextAction)
        self.present(alert, animated: true, completion: nil)
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
            changeColor(label: waterLabel)
            setRiceTimer(selector: #selector(waterTimerUpdate))
            
        case "water":
            changeColor(label: boilLabel)
            
        case "boil":
            changeColor(label: lowHeatLabel)
            setRiceTimer(selector: #selector(lowHeatTimerUpdate))
            
        case "lowHeat":
            changeColor(label: waterConfirmationLabel)
            
        case "add":
            changeColor(label: waterConfirmationLabel)
            
        case "withWater":
            changeColor(label: addLabel)
            setRiceTimer(selector: #selector(addTimerUpdate))
            
        case "withoutWater":
            changeColor(label: highHeatLabel)
            setRiceTimer(selector: #selector(highHeatTimerUpdate))
            
        case "highHeat":
            changeColor(label: steamLabel)
            setRiceTimer(selector: #selector(steamTimerUpdate))
            
        default:
            break
        }
    }

    func changeColor(label: UILabel) {
        washLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        waterLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        boilLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        lowHeatLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        waterConfirmationLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        addLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        highHeatLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)
        steamLabel.textColor = UIColor.init(red: 0.3333, green: 0.3333, blue: 0.3333, alpha: 1.0)

        label.textColor = UIColor.init(red: 1.0, green: 0.4, blue: 0.8, alpha: 1.0)
    }
    
    func setRiceTimer(selector: Selector) {
        riceTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: selector, userInfo: nil, repeats: true)
    }

    func waterTimerUpdate() {
        waterTime -= 1
        waterTimeLabel.text = timerString(time: waterTime)
        
        if waterTime == 0 {
            riceTimer.invalidate()
            alert(type: "water", message: "中火にして沸騰してね！")
        }
    }
    
    func lowHeatTimerUpdate() {
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
        highHeatTime -= 1
        highHeatTimeLabel.text = timerString(time: highHeatTime)
        
        if highHeatTime == 0 {
            riceTimer.invalidate()
            alert(type: "highHeat", message: "最後に、火を止めて蒸らしてね！")
        }
    }
    
    func steamTimerUpdate() {
        steamTime -= 1
        steamTimeLabel.text = timerString(time: steamTime)
        
        if steamTime == 0 {
            riceTimer.invalidate()
            finishAlert()
        }
    }
    
    func finishAlert() {
        let alert = UIAlertController(title: "完成！！！！！！", message: "", preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "TOPへもどる", style: .default, handler: {(action:UIAlertAction!) -> Void in
            self.goToTopPage()
        })
        alert.addAction(nextAction)
        self.present(alert, animated: true, completion: nil)
    }

    func goToTopPage() {
        self.dismiss(animated: true, completion: nil)
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
