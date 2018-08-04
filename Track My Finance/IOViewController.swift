//
//  IOViewController.swift
//  Track My Finance
//
//  Created by Filip Ma on 31.7.18.
//  Copyright © 2018 Filip Masar. All rights reserved.
//

import UIKit

class IOViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    
    var records = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        table.rowHeight = 50
        
        if state == "income" {
            navBarTitle.title = "Incomes"
            totalLabel.textColor = UIColor.green
            if let temp = UserDefaults.standard.object(forKey: "incomes") as? [[String:String]] {
                records = temp
            }
        } else {
            navBarTitle.title = "Outgoings"
            totalLabel.textColor = UIColor.red
            if let temp = UserDefaults.standard.object(forKey: "outgoings") as? [[String:String]] {
                records = temp
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if state == "income" {
            if let temp = UserDefaults.standard.object(forKey: "incomes") as? [[String:String]] {
                records = temp
            }
        } else {
            if let temp = UserDefaults.standard.object(forKey: "outgoings") as? [[String:String]] {
                records = temp
            }
        }
        
        var total = 0.0
        for record in records {
            if let amount = record["amount"] {
                total += Double(amount)!
            }
        }
        totalLabel.text = "\(total)$"
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as? RecordTableViewCell {
            cell.reasonLabel.text = records[indexPath.row]["reason"]
            cell.dateLabel.text = records[indexPath.row]["date"]
            cell.amountLabel.text = records[indexPath.row]["amount"]
            return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "addRecordSegue", sender: nil)
    }
    
}
