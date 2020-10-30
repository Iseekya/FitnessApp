//
//  CaloriesViewController.swift
//  SHApp
//
//  Created by Stefan Hitrov on 28.10.20.
//

import UIKit
import Alamofire

class CaloriesViewController: UIViewController {
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var caloriesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Utilities.styleTextField(foodTextField)
        Utilities.styleFilledButton(searchButton)
        
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        guard let input = foodTextField.text else { return }
        
        APIService.getCalories(for: input) { (calories) in
            self.caloriesTextView.text = "\(calories) calories"
        }
    }
}


