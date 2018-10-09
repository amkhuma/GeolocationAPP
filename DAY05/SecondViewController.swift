//
//  SecondViewController.swift
//  DAY05
//
//  Created by Andile MKHUMA on 2018/10/08.
//  Copyright © 2018 Andile MKHUMA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text =  Places.places[indexPath.row].2
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tabBarController?.selectedIndex = 0
        let mapview : FirstViewController = self.tabBarController?.viewControllers![0] as! FirstViewController
        
        mapview.addPointInMap(lat: Places.places[indexPath.row].0, long: Places.places[indexPath.row].1, title: Places.places[indexPath.row].2, subtitle: Places.places[indexPath.row].3)
//        if let cell = tableView.cellForRow(at: indexPath) {
//            if cell.isSelected {
//                print(indexPath.row)
//            }
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

