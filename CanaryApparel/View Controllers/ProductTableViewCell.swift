//
//  ProductTableViewCell.swift
//  CanaryApparel
//
//  Created by nathan boamah on 06/12/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {


    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
    
    var product: Product? {
        didSet {
            self.update()
        }
    }
   
//append to image view and title
    func update() {
        productImageView.image = product?.image
        productLabel.text = product?.title
    }
}
