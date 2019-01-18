//
//  SampleTableVC.swift
//  SegmentProject
//
//  Created by ERER on 2019/1/18.
//  Copyright © 2019 ERER. All rights reserved.
//

import UIKit

class SampleTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SampleTableVC")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableVC", for: indexPath)
        cell.textLabel?.text = "Sample List Title \(indexPath.row)"
        return cell
    }
    

    
}
