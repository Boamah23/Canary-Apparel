//
//  SignUpViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 21/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstNameLine = CALayer()
        let surnameLine = CALayer()
        let emailLine = CALayer()
        let passwordLine = CALayer()
        
        
        firstNameLine.frame = CGRect(x: 0, y: firstNameTextField.frame.height - 2, width: firstNameTextField.frame.width, height: 2)
        firstNameLine.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1).cgColor
        firstNameTextField.borderStyle = .none
        firstNameTextField.layer.addSublayer(firstNameLine)
        
        surnameLine.frame = CGRect(x: 0, y: surnameTextField.frame.height - 2, width: surnameTextField.frame.width, height: 2)
        surnameLine.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1).cgColor
        surnameTextField.borderStyle = .none
        surnameTextField.layer.addSublayer(surnameLine)
        
        emailLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
        emailLine.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1).cgColor
        emailTextField.borderStyle = .none
        emailTextField.layer.addSublayer(emailLine)
        
        passwordLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width, height: 2)
        passwordLine.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1).cgColor
        passwordTextField.borderStyle = .none
        passwordTextField.layer.addSublayer(passwordLine)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func registerTapped(_ sender: Any) {
    }
    
}
