//
//  catagorydetail.swift
//  BudgetUniversity
//
//  Created by 无比机智的树懒大人 on 11/29/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit

protocol ChangesongTitleDelegate: class {
    func SongTitleChanged(newTitle: String,  indexpath : IndexPath)
    func SongTitleChanged2(newTitle: String,  indexpath : IndexPath)
    func SongTitleChanged3(newTitle: String,  indexpath : IndexPath)
}
class catagorydetail: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var songs: [Songs]!
    
    let reuseIdentifier = "CellReuse"
    let cellHeight: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Cornell life"
        view.backgroundColor = .black
        
        let intro = Songs(name: "Intro to my anxiety", artist: "Hoodie Allen", albumn: "Happy Camper")
        let blvd = Songs(name: "Boulevard of Broken Dreams", artist: "Green Day", albumn: "American Idiots")
        let hardlife = Songs(name: "It's a hard life", artist: "Queen", albumn: "The Works")
        let youcant = Songs(name: "You can't always get what you want", artist: "The Rolling Stone", albumn: "The Works")
        let stway = Songs(name: "Stairway to heaven", artist: "Led Zeppelin", albumn: "Led Zeppelin IV")
        let bd = Songs(name: "Brain Damage", artist: "Pink Floyd", albumn: "The Dark side of Moon")
        let co = Songs(name: "Carry on", artist: "fun.", albumn: "Some Nights")
        let today = Songs(name: "Today", artist: "The Smashing Pumpkin", albumn: "Siamese Dream")
        let loo = Songs(name: "Laughing on the outside", artist: "Bernadette", albumn: "Cleopatra Girls")
        let cn = Songs(name: "Comfortably Numb", artist: "Pink Floyd", albumn: "Live at Knebworth 1990")
        songs = [intro, blvd, hardlife, youcant, stway, bd, co, today, loo, cn]
        
        // Initialize tableView
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkGray
        tableView.register(Songtableview.self, forCellReuseIdentifier: reuseIdentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Songtableview
        let song = songs[indexPath.row]
        cell.configure(for: song)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let navViewController = NavViewController()
//        navViewController.delegate = self
//        let cell = tableView.cellForRow(at: indexPath) as! Songtableview
//        let song = songs[indexPath.row]
//        navViewController.customInit(artist: (songs?[indexPath.row].artist)!, albumn:(songs?[indexPath.row].albumn)!,title:(songs?[indexPath.row].name)!, indexpath: indexPath)
//        self.navigationController?.pushViewController(navViewController, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
//
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//extension ViewController: ChangesongTitleDelegate {
//    func SongTitleChanged(newTitle: String, indexpath: IndexPath) {
//        let cell = self.tableView.cellForRow(at: indexpath) as! Songtableview
//        cell.nameLabel.text = newTitle
//
//    }
//    func SongTitleChanged2(newTitle: String, indexpath: IndexPath) {
//        let cell = self.tableView.cellForRow(at: indexpath) as! Songtableview
//        cell.albLabel.text = newTitle
//
//    }
//    func SongTitleChanged3(newTitle: String, indexpath: IndexPath) {
//        let cell = self.tableView.cellForRow(at: indexpath) as! Songtableview
//        cell.artLabel.text = newTitle
//
//    }
//
//}
