//
//  TodayImpressionsViewController.swift
//  NabedakiGohan
//
//  Created by えばた あや on 2016/10/14.
//  Copyright © 2016年 えばた あや. All rights reserved.
//

import UIKit

class TodayImpressionsViewController: UIViewController {
    
    var waterInterval = 0
    var lowHeatInterval = 0
    var highHeatInterval = 0
    var steamInterval = 0
    var steamLowHeatInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func softSegumentChecked(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            waterInterval = -300
        case 2:
            waterInterval = 300
        default:
            break
        }
    }
    
    @IBAction func waterSegumentChecked(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            lowHeatInterval = -60
        case 2:
            lowHeatInterval = 60
        default:
            break
        }
    }
    
    @IBAction func burntSegumentChecked(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            highHeatInterval = -2
        case 2:
            highHeatInterval = 5
        default:
            break
        }
    }
    
    @IBAction func coreSegumentChecked(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            steamInterval = 120
            steamLowHeatInterval = 60
        default:
            break
        }
    }
    
    @IBAction func subminButtonClicked() {
        let riceTimeUserDefaults = UserDefaults.standard
        
        setRiceTimeUserDefaults(userDefaults: riceTimeUserDefaults, key: "waterTime", interval: waterInterval)
        setRiceTimeUserDefaults(userDefaults: riceTimeUserDefaults, key: "lowHeatTime", interval: lowHeatInterval + steamLowHeatInterval)
        setRiceTimeUserDefaults(userDefaults: riceTimeUserDefaults, key: "highHeatTime", interval: highHeatInterval)
        setRiceTimeUserDefaults(userDefaults: riceTimeUserDefaults, key: "steamTime", interval: steamInterval)
        
        riceTimeUserDefaults.synchronize()
    }
    
    func setRiceTimeUserDefaults(userDefaults: UserDefaults, key: String, interval: Int) {
        let time = userDefaults.integer(forKey: key) + interval
        userDefaults.set(time, forKey: key)
    }
}
