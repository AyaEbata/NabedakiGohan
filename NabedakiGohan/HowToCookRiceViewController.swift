//
//  HowToCookRiceViewController.swift
//  NabedakiGohan
//
//  Created by えばた あや on 2016/10/14.
//  Copyright © 2016年 えばた あや. All rights reserved.
//

import UIKit

class HowToCookRiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        print(defaults.integer(forKey: "waterTime"))
    }
    
}
