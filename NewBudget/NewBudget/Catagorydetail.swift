//
//  catagorydetail.swift
//  BudgetUniversity
//
//  Created by 无比机智的树懒大人 on 11/29/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit


class catagorydetail: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var spending: [Spending]!
    var cata: String!
    
    
    let reuseIdentifier = "CellReuse"
    let cellHeight: CGFloat = 80
    
    
    func cusinit(name: String){
        self.cata = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Spending in catagory"
        view.backgroundColor = .black
        spending = BudgetAPI.getfoodspending()
        
        
        // Initialize tableView
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkGray
        tableView.register(Spendingtableview.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Spendingtableview
        let spt = spending[indexPath.row]
        cell.configure(for: spt )
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spending.count
    }
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


