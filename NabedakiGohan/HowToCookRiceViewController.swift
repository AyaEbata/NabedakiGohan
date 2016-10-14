//
//  HowToCookRiceViewController.swift
//  NabedakiGohan
//
//  Created by えばた あや on 2016/10/14.
//  Copyright © 2016年 えばた あや. All rights reserved.
//

import UIKit

class HowToCookRiceViewController: UIViewController {

    var riceTimer: Timer!
    let riceTimeUserDefaults = UserDefaults.standard
    var waterTime: Int!
    
    @IBOutlet weak var waterTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUserDefaults()
        
        riceTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    func initUserDefaults() {
        waterTime = riceTimeUserDefaults.integer(forKey: "waterTime")
        waterTimeLabel.text = timerString(time: waterTime)
    }

    func timerUpdate(timer: Timer) {
        print("\(String(format: "%02d", Int(floor(Double(waterTime/60))))):\(String(format: "%02d", waterTime%60))")

        waterTime = waterTime - 1
        waterTimeLabel.text = timerString(time: waterTime)
        
        if waterTime == 0 {
            riceTimer.invalidate()
        }
    }
    
    func timerString(time: Int) -> String {
        return "\(String(format: "%02d", Int(floor(Double(time/60))))):\(String(format: "%02d", time%60))"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        riceTimer.invalidate()
    }
    
}
