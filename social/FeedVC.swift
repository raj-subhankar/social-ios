//
//  FeedVC.swift
//  social
//
//  Created by Subhankar Dee Raj on 01/06/17.
//  Copyright © 2017 Subhankar. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutTaped(_ sender: Any) {
        KeychainWrapper.standard.remove(key: KEY_UID)
        try! FIRAuth.auth()?.signOut() 
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}
