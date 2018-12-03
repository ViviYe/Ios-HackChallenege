//
//  FirstViewController.swift
//  NewBudget
//
//  Created by 无比机智的树懒大人 on 12/2/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var TextView: UITextView!
    var Label1: UILabel!
    var Label2: UILabel!
    var text1: UITextField!
    var text2: UITextField!
    var addButton: UIButton!
    
    
    
    @IBOutlet weak var output: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        Label1 = UILabel()
        Label1.translatesAutoresizingMaskIntoConstraints = false
        Label1.text = "Catagory:"
        Label1.textAlignment = .center
        Label1.font = .systemFont(ofSize: 20, weight: .bold)
        Label1.textColor = .black
        view.addSubview(Label1)
        Label2 = UILabel()
        Label2.translatesAutoresizingMaskIntoConstraints = false
        Label2.text = "amount:"
        Label2.textAlignment = .center
        Label2.font = .systemFont(ofSize: 20, weight: .bold)
        Label2.textColor = .black
        view.addSubview(Label2)
        text1 = UITextField(frame: CGRect(x: 180, y: 148, width: 155, height: 30))
        text1.placeholder = "Enter catagory"
        text1.borderStyle = UITextField.BorderStyle.roundedRect
        text1.autocorrectionType = UITextAutocorrectionType.no
        text1.keyboardType = UIKeyboardType.default
        text1.returnKeyType = UIReturnKeyType.done
        text1.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        view.addSubview(text1)
        text2 = UITextField(frame: CGRect(x: 180, y: 194, width: 155, height: 30))
        text2.placeholder = "amount spent"
        text2.borderStyle = UITextField.BorderStyle.roundedRect
        text2.autocorrectionType = UITextAutocorrectionType.no
        text2.keyboardType = UIKeyboardType.default
        text2.returnKeyType = UIReturnKeyType.done
        view.addSubview(text2)
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Adding spending", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        addButton.addTarget(self, action: #selector(addButtonWasTapped), for: .touchUpInside)
        view.addSubview(addButton)
        TextView = UITextView()
        TextView.backgroundColor = .lightGray
        TextView.translatesAutoresizingMaskIntoConstraints = false
        TextView.isEditable = true
        TextView.text = "Other notes"
        TextView.font = .systemFont(ofSize: 14, weight: .bold)
        
        TextView.textColor = .black
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        TextView.layer.borderWidth = 1.5
        TextView.layer.borderColor = borderColor.cgColor
        TextView.layer.cornerRadius = 5.0
        view.addSubview(TextView)
        
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            Label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            Label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:-180),
            //Label1.widthAnchor.constraint(equalTo: view.leadingAnchor),
            Label1.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            Label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Label2.topAnchor.constraint(equalTo: Label1.topAnchor, constant: 50),
            Label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:-180),
            //Label1.widthAnchor.constraint(equalTo: view.leadingAnchor),
            Label2.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            //text1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text1.topAnchor.constraint(equalTo: Label1.topAnchor),
            text1.leadingAnchor.constraint(equalTo: Label1.leadingAnchor, constant:50),
            //Label1.widthAnchor.constraint(equalTo: view.leadingAnchor),
            text1.trailingAnchor.constraint(equalTo: Label2.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: TextView.bottomAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            TextView.topAnchor.constraint(equalTo: Label2.bottomAnchor, constant: 20),
            TextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            TextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            TextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)
            ])
        
    
        
    }
    
    @objc func addButtonWasTapped() {
        let opttext1:String? = text1.text
        let opttext2:String? = text2.text
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        if let unwrapt1 = opttext1{
            if let unwrapt2 = opttext2{
                if (unwrapt2 != "" && unwrapt1 != ""){
                    NetworkManager.postcata(catagory: unwrapt1, amount: Int(unwrapt2)!)
                }
            }
        }
        text1.text = ""
        text2.text = ""
        
        
    }

}

