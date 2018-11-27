//
//  ViewController.swift
//  yy453_p3
//
//  Created by 无比机智的树懒大人 on 10/20/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit


protocol ChangeButtonTitleDelegate: class {
    func buttonTitleChanged(newTitle: String)
    func buttonTitleChanged2(newTitle: String)
}

class ViewController: UIViewController {
    var pushNavViewControllerButton: UIButton!
    var presentModalViewControllerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Set the navigation controller's title
        title = "Budget!"
        
        pushNavViewControllerButton = UIButton()
        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton.setTitle("add spending", for: .normal)
        pushNavViewControllerButton.setTitleColor(.black, for: .normal)
        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(pushNavViewControllerButton)
        
        presentModalViewControllerButton = UIButton()
        presentModalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        presentModalViewControllerButton.setTitle("view spending", for: .normal)
        presentModalViewControllerButton.setTitleColor(.black, for: .normal)
        presentModalViewControllerButton.addTarget(self, action: #selector(pushNavViewController2), for: .touchUpInside)
        view.addSubview(presentModalViewControllerButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushNavViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            presentModalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentModalViewControllerButton.topAnchor.constraint(equalTo: pushNavViewControllerButton.bottomAnchor, constant: 16),
            presentModalViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
    
    @objc func pushNavViewController() {
        let navViewController = Addcontroller()
        
       // navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }
    
    @objc func pushNavViewController2()  {
        let navViewController = ViewSpendingController()
        
        //navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }
    
}


extension ViewController: ChangeButtonTitleDelegate {
    func buttonTitleChanged(newTitle: String) {
        presentModalViewControllerButton.setTitle(newTitle, for: .normal)
    }
    func buttonTitleChanged2(newTitle: String) {
        pushNavViewControllerButton.setTitle(newTitle, for: .normal)
    }
}
