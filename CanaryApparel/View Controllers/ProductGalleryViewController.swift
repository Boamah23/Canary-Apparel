//
//  ProductGalleryViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 30/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit


class ProductGalleryViewController: UIViewController {
    
    var collectionData = ["image1", "image2", "image3", "image4", "image5", "image6"]
    
    let productImages: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!,
        UIImage(named: "image5")!,
        UIImage(named: "image6")!,
    ]
    
    let prices = [("£1"), ("£2"), ("£3"), ("£4"), ("£5"), ("£6")]
    
    let decriptions = [("enter product description"),("enter product description"),("enter product description"),("enter product description"),("enter product description"),("enter product description")]
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        }


}


extension ProductGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.productImage.image = productImages[indexPath.item]
        cell.productPrice.text = prices[indexPath.item]
    return cell
    }
    
    
    
        
}
