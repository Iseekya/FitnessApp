//
//  LogoutViewController.swift
//  SHApp
//
//  Created by Stefan Hitrov on 23.10.20.
//

import UIKit
import Firebase

class LogoutViewController: Exit {
    
    
    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        logout()
    }
    
}
