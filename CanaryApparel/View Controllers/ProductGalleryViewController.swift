//
//  ProductGalleryViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 30/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit


class ProductGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let summerWear = [("product 1"), ("product 2"), ("product 3"), ("product 4"), ("product 5"), ("product 6")]
    
    let prices = [("£1"), ("£2"), ("£3"), ("£4"), ("£5"), ("£6")]
    
    let decriptions = [("enter product description"),("enter product description"),("enter product description"),("enter product description"),("enter product description"),("enter product description")]
    
    let productImages: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!,
        UIImage(named: "image5")!,
        UIImage(named: "image6")!,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
            collectionView.dataSource = self
            collectionView.delegate = self
            

        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return summerWear.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            
            cell.productImageView.image = productImages[indexPath.item]
            cell.productDescription.text = decriptions[indexPath.item]
            cell.productPrice.text = prices[indexPath.item]
            
            return cell
        }

}
