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
    
    //declare colours that will be used
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    //declare variables
    var img = UIImage()
    var priceLbl = ""
    var descriptionLbl = ""
    
    //declare array of sizes
    let sizes = ["Extra Small - XS",
                "Small - S",
                "Medium - M",
                "Large - L",
                "Extra Large - XL"]
    
    var selectedSize: String?

    //passes data to UIimage and strings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product.image = img
        
        pricing.text = priceLbl
        
        name.text = descriptionLbl
        //runs functions
        createSizeSelector()
        createToolBar()
        
        self.heartButton?.setSelected(selected: false, animated: true)
        
        
    }
    
    
    //share button activity controller
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [img, priceLbl,descriptionLbl], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    //create size selector
    func createSizeSelector() {
        let sizeSelector = UIPickerView()
        sizeSelector.delegate = self as UIPickerViewDelegate
        sizeSelection.inputView = sizeSelector
    }
    //create tool bar
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DetailViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        sizeSelection.inputAccessoryView = toolBar
    }
    //Dismisses the keyboard from the screen
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
        //counts number of items in array and returns value
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
