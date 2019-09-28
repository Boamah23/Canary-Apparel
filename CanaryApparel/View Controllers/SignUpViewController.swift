//
//  SignUpViewController.swift
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
    
    func fieldValidation() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            surnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }

        
        return nil
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
        // Validate the fields
        let error = fieldValidation()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let surname = surnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError(error)
                    
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "surname":surname, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError(error!)
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToSearch()
                }
                
            }
            
            
            
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
    
    func transitionToSearch() {
        
        let searchViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.searchViewController) as? UIViewController
        
        view.window?.rootViewController = searchViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
