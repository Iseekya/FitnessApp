//
//  LoginViewController.swift
//  SHApp
//
//  Created by Stefan Hitrov on 16.10.20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
        
    }
    
    func setupElements() {
        
        // Hide the error label
        errorTextField.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    

    func validateFields() -> String? {
        
        // Chech that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // Validate Text Fields
        
        let error = validateFields()
        
        if error != nil {
            // There is something wrong with the fields, show error message
            showError(error!)
        }
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            // Couldn't sign in
            if error != nil {
                self.errorTextField.text = error!.localizedDescription
                self.errorTextField.alpha = 1
            } else {
                self.transitionToHome()
            }
            
        }
        
    }
    
    func showError(_ message: String) {
        
        errorTextField.text = message
        errorTextField.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
    
    

}
