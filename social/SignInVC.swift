//
//  ViewController.swift
//  social
//
//  Created by Subhankar Dee Raj on 26/05/17.
//  Copyright © 2017 Subhankar. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnClicked(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("SingInVC: Unable to authenticate with facebook - \(error)")
            } else if result?.isCancelled == true {
                print("SignInVC: User cancelled Facebook authentication")
            } else {
                print("SignInVC: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firbaseAuth(credential)
            }
        }
        
    }
    
    func firbaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("SignInVC: Unable to authenticate with Firebase - \(error)")
                
            } else {
                print("SignInVC: Successfully authenticated with Firebase")
            }
        })
    }

}

