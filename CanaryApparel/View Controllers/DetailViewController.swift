//
//  DetailViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 29/10/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var product: UIImageView!
    
    var img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product.image = img

        // Do any additional setup after loading the view.
    }
    

}
