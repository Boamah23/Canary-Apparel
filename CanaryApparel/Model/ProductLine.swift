//
//  ProductLine.swift
//  CanaryApparel
//
//  Created by nathan boamah on 05/12/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit

class ProductLine {
    var products: [Product]
    var name: String
    
    init(named: String, includedProducts: [Product]){
        name = named
        products = includedProducts
        
    }
    
    class func getProductLines() -> [ProductLine] {
        return [stockImages()]
    }
    
    private class func stockImages() -> ProductLine {
        var products = [Product]()
        
        products.append(Product(titled: "Cropped Levi's t-shirt", imageName: "image1"))
        products.append(Product(titled: "Cropped vest top", imageName: "image2"))
        products.append(Product(titled: "White and black stripped top", imageName: "image3"))
        products.append(Product(titled: "Mustard long-line shirt", imageName: "image4"))
        products.append(Product(titled: "Denim dungarees", imageName: "image5"))
        products.append(Product(titled: "White bodysuit", imageName: "image6"))
        
        return ProductLine(named: "stockImages", includedProducts: products)
    }
}

