//
//  DetailViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 29/10/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit
import FaveButton


func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class DetailViewController: UIViewController, FaveButtonDelegate {

    @IBOutlet weak var product: UIImageView!
    
    @IBOutlet weak var pricing: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var sizeSelection: UITextField!
    
    
    @IBOutlet weak var heartButton: FaveButton?
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    
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
        
        self.heartButton?.setSelected(selected: true, animated: false)
        
        
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
    
        
        func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
        }
        
        func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
            if( faveButton === heartButton){
                return colors
            }
            return nil
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
