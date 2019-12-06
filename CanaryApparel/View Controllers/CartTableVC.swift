//
//  CartTableVC.swift
//  CanaryApparel
//
//  Created by nathan boamah on 06/12/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit

class CartTableVC: UITableViewController {
    
    //data model

    var products = ProductLine.getProductLines()[0].products

    override func viewDidLoad() {
        super.viewDidLoad()
        //add navigation bar button 
        navigationItem.rightBarButtonItem = editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    //Returns a reusable table-view cell object located by its identifier.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        
        cell.product = product
        return cell
    }
    //set row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    //delete function
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.products.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }


}
