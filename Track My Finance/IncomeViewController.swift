//
//  IncomeViewController.swift
//  Track My Finance
//
//  Created by Filip Ma on 31.7.18.
//  Copyright © 2018 Filip Masar. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var incomes = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        table.rowHeight = 50
        
        if let temp = UserDefaults.standard.object(forKey: "incomes") as? [[String:String]] {
            incomes = temp
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let temp = UserDefaults.standard.object(forKey: "incomes") as? [[String:String]] {
            incomes = temp
        }
        
        var total = 0.0
        for income in incomes {
            if let amount = income["amount"] {
                total += Double(amount)!
            }
        }
        totalLabel.text = "+\(total)$"
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as? RecordTableViewCell {
            cell.reasonLabel.text = incomes[indexPath.row]["reason"]
            cell.dateLabel.text = incomes[indexPath.row]["date"]
            cell.amountLabel.text = incomes[indexPath.row]["amount"]
            return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "addIncomeSegue", sender: nil)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
