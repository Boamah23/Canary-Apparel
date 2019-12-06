//
//  Product.swift
//  CanaryApparel
//
//  Created by nathan boamah on 05/12/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import Foundation
import UIKit


class Product {
    var image: UIImage
    var title: String
    
    init(titled: String, imageName: String){
        self.title = titled
        if let image = UIImage(named: imageName){
            self.image = image
        }else{
            self.image = UIImage(named: "default")!
        }
    }
}
