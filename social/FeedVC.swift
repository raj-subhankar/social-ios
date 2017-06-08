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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    
    
    
    @IBAction func signOutTaped(_ sender: Any) {
        KeychainWrapper.standard.remove(key: KEY_UID)
        try! FIRAuth.auth()?.signOut() 
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}
