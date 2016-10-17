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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        // unwind segue
    }
}

