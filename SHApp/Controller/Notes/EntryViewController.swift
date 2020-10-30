//
//  EntryViewController.swift
//  SHApp
//
//  Created by Stefan Hitrov on 23.10.20.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
   // @IBOutlet weak var saveButton: UIBarButtonItem!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTapped))
    }
    
    
    @objc func saveTapped() {
        if let text = titleField.text, !text.isEmpty, let note = noteField.text, !note.isEmpty {
            completion?(text, note)
        }
    }
    
}
