//
//  SignInViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 21/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit
/*import Firebase
import FirebaseAuth
import FirebaseFirestore*/


@available(iOS 13.0, *)
class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let emailLine = CALayer()
        let passwordLine = CALayer()
        
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

    @IBAction func forgotPasswordTapped(_ sender: Any) {
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }

}
