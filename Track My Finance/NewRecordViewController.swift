//
//  NewRecordViewController.swift
//  Track My Finance
//
//  Created by Filip Ma on 31.7.18.
//  Copyright © 2018 Filip Masar. All rights reserved.
//

import UIKit

class NewRecordViewController: UIViewController {
    
    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var dataStored = [[String:String]]()

    @IBAction func addButtonClicked(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let date = dateFormatter.string(from: datePicker.date)
        
        if reasonTextField.text != "" && amountTextField.text != "" {
            if let reason = reasonTextField.text {
                if let amount = amountTextField.text {
                    let newIncome = ["date":date, "reason":reason, "amount": amount]
                    dataStored.append(newIncome)
                    
                    // SAVE DATA
                    if state == "income" {
                        UserDefaults.standard.set(dataStored, forKey: "incomes")
                    } else {
                        UserDefaults.standard.set(dataStored, forKey: "outgoings")
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if state == "income" {
            navTitle.title = "Add new income"
            reasonTextField.placeholder = "E.g. Salary"
            amountTextField.placeholder = "345.9"
            if let temp = UserDefaults.standard.object(forKey: "incomes") as? [[String:String]] {
                dataStored = temp
            }
        } else {
            navTitle.title = "Add new outgoing"
            reasonTextField.placeholder = "E.g. Friday night"
            amountTextField.placeholder = "19.9"
            if let temp = UserDefaults.standard.object(forKey: "outgoings") as? [[String:String]] {
                dataStored = temp
            }
        }
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
