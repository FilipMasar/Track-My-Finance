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
    
    // ALERT
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

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
                        showAlert(title: "Success", message: "Income added!")
                    } else {
                        UserDefaults.standard.set(dataStored, forKey: "outgoings")
                        showAlert(title: "Success", message: "Outgoing added!")
                    }
                }
            }
        } else {
            showAlert(title: "Missing information", message: "You have to provide reason and amount!")
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
    
    // close keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
