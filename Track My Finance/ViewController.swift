//
//  ViewController.swift
//  Track My Finance
//
//  Created by Filip Ma on 31.7.18.
//  Copyright © 2018 Filip Masar. All rights reserved.
//

import UIKit

var state = ""

class ViewController: UIViewController {
    
    @IBAction func incomeButtonClicked(_ sender: Any) {
        state = "income"
        performSegue(withIdentifier: "viewSegue", sender: nil)
    }
    
    @IBAction func outgoingButtonClicked(_ sender: Any) {
        state = "outgoing"
        performSegue(withIdentifier: "viewSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

