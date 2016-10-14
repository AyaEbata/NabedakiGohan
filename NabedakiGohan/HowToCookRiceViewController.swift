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
    var waterTime: Int!
    
    @IBOutlet weak var waterTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUserDefaults()
    }
    
    func initUserDefaults() {
        waterTime = riceTimeUserDefaults.integer(forKey: "waterTime")
        waterTime = 5
        waterTimeLabel.text = timerString(time: waterTime)
    }

    @IBAction func washRiceButtonClicked(){
        riceTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }

    func timerUpdate(timer: Timer) {
        waterTime = waterTime - 1
        waterTimeLabel.text = timerString(time: waterTime)
        
        if waterTime == 0 {
            riceTimer.invalidate()
            finishAlert()
        }
    }
    
    func timerString(time: Int) -> String {
        return "\(String(format: "%02d", Int(floor(Double(time/60))))):\(String(format: "%02d", time%60))"
    }
    
    func finishAlert() {
        let alert = UIAlertController(title: "つぎのこうてい", message: "中火にして沸騰してね！", preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "次へ", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            print("次へ")
        })
        alert.addAction(nextAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if riceTimer.isValid == true {
            riceTimer.invalidate()
        }
    }
    
}
