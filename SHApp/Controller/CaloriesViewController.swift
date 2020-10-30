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
        
        print("Hello")
        APIService.getCalories(for: "2 large apple") { (calories) in
            print(calories)
        }
        
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        let input = foodTextField.text
    }
}

//APIService.getCalories(for: "1 large apple") { (calorie) in
//    print(calorie)
//}


