//
//  SignInViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 21/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


@available(iOS 13.0, *)
class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
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

    
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                showError(error as Any)
                
            }
            else {
                
                
                //switch to tab view

            }
            
        }
        
        func showError(_ sender: Any) {
            let alert = UIAlertController(title: "ERROR", message: "Something isn't right, try again", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Cancel", style: .default){ (action) in
                print("Cancel")
            }
            alert.addAction(action1)
            present(alert, animated: true, completion: nil)

        }
    }
    


    }


