//
//  ViewController.swift
//  NabedakiGohan
//
//  Created by えばた あや on 2016/10/12.
//  Copyright © 2016年 えばた あや. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello, Rice!")
        
        let riceTimeUserDefaults = UserDefaults.standard
        if !riceTimeUserDefaults.bool(forKey: "notFirst") {
            initUserDefaults(userDefaults: riceTimeUserDefaults)
        }
    }
    
    func initUserDefaults(userDefaults: UserDefaults) {
        userDefaults.set(true, forKey: "notFirst")
        
        userDefaults.set(1800, forKey: "waterTime")
        userDefaults.set(600, forKey: "lowHeatTime")
        userDefaults.set(10, forKey: "highHeatTime")
        userDefaults.set(600, forKey: "steamTime")
        
        userDefaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        // unwind segue
    }
}

