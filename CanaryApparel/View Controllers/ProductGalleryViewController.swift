//
//  ProductGalleryViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 30/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.

import UIKit


class ProductGalleryViewController: UIViewController {
    //stores an array of images
    var collectionData = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8"]
    
    let productImages: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!,
        UIImage(named: "image5")!,
        UIImage(named: "image6")!,
        UIImage(named: "image7")!,
        UIImage(named: "image8")!,
    ]
    //stores array of prices
    let prices = [("£26.00"), ("£16.00"), ("£28.00"), ("£34.00"), ("£38.00"), ("£36.00"), ("£20.00"), ("£30.00")]
    //stores array of descriptions
    let descriptions = [("Cropped Levi's t-shirt"),("Cropped vest top"),("White and black stripped top"),("Mustard long-line shirt"),("Denim dungarees"),("White bodysuit"),("Hipster white t-shirt"),("white denim dungarees")]
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        }


}

//determines the amount of items in section
extension ProductGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //counts amount of items in array
        return collectionData.count
    }
    //Returns a reusable table-view cell object located by its identifier.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.productImage.image = productImages[indexPath.item]
        cell.productPrice.text = prices[indexPath.item]
        cell.productDescription.text = descriptions[indexPath.item]
    return cell
    }
    //passes data to detail view controller
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.img = productImages[indexPath.item]
        vc?.priceLbl = prices[indexPath.item]
        vc?.descriptionLbl = descriptions[indexPath.item]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
        
}
