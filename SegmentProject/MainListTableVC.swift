//
//  MainListTableVC.swift
//  SegmentProject
//
//  Created by ERER on 2019/1/18.
//  Copyright © 2019 ERER. All rights reserved.
//

import UIKit

class MainListTableVC: UITableViewController {
    
    let listArray = ["list1", "list2", "list3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "主页"
        tableView.rowHeight = 64
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MainListTableVC")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainListTableVC", for: indexPath)

        cell.textLabel?.text = listArray[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(SampleVC1(), animated: true)
        } else if indexPath.row == 1 {
            self.navigationController?.pushViewController(SampleVC2(), animated: true)
        } else if indexPath.row == 2 {
            self.navigationController?.pushViewController(SampleVC3(), animated: true)
        }

    }

}
