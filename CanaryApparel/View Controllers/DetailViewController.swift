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
    
    
    @IBOutlet weak var sizeSelection: UITextField!
    
    
    var img = UIImage()
    var priceLbl = ""
    var descriptionLbl = ""
    
    
    let sizes = ["Extra Small - XS",
                "Small - S",
                "Medium - M",
                "Large - L",
                "Extra Large - XL"]
    
    var selectedSize: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product.image = img
        
        pricing.text = priceLbl
        
        name.text = descriptionLbl
        
        createSizeSelector()
        createToolBar()
        
    }
    
    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [img, priceLbl,descriptionLbl], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func createSizeSelector() {
        let sizeSelector = UIPickerView()
        sizeSelector.delegate = self as UIPickerViewDelegate
        sizeSelection.inputView = sizeSelector
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DetailViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        sizeSelection.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSize = sizes[row]
        sizeSelection.text = selectedSize
    }
}
