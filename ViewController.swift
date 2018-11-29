//
//  ViewController.swift
//  BudgetU
//
//  Created by Yuwei Ye on 11/28/18.
//  Copyright © 2018 Rishitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expenseType: UITextField!
    @IBOutlet weak var amountSpent: UITextField!
    @IBOutlet weak var notes: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expenseType.delegate = self
        amountSpent.delegate = self
        notes.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        textView.text = "Expense Type: \(expenseType.text!)\nAmount Spent: \(amountSpent.text!)\nNotes: \(notes.text!)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        notes.resignFirstResponder()
    }
}
extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
