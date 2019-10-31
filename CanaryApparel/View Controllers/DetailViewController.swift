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
    
    @IBOutlet weak var pricing: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    var img = UIImage()
    var priceLbl = ""
    var descriptionLbl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product.image = img
        
        pricing.text = priceLbl
        
        name.text = descriptionLbl

        

    }
    
    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [img, priceLbl,descriptionLbl], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    

}
