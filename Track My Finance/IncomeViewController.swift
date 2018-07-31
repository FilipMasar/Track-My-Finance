//
//  IncomeViewController.swift
//  Track My Finance
//
//  Created by Filip Ma on 31.7.18.
//  Copyright © 2018 Filip Masar. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "addIncomeSegue", sender: nil)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
