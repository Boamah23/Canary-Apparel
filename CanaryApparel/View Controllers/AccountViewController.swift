//
//  AccountViewController.swift
//  CanaryApparel
//
//  Created by nathan boamah on 21/09/2019.
//  Copyright © 2019 nathan boamah. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //button action
    @IBAction func signOutTapped(_ sender: Any){
        do{
            //signs out user
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
    
    
    

}
