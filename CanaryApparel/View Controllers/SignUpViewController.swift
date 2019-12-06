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

//
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var surnameTextField: UITextField!
       
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
   
        firstNameTextField.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        

        surnameTextField.attributedPlaceholder = NSAttributedString(string: "Surname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        

        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
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
                    self.showError(error as Any)
                    
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
    
    
}
