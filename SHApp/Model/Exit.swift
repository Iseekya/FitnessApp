//
//  Exit.swift
//  SHApp
//
//  Created by Stefan Hitrov on 27.10.20.
//

import Foundation
import Firebase

class Exit: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func logout() {
        try! Auth.auth().signOut()
        let firstVc = storyboard?.instantiateViewController(identifier: "viewId") as? ViewController
        view.window?.rootViewController = firstVc
        view.window?.makeKeyAndVisible()
        
        
    }

}
