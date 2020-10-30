//
//  NotesViewController.swift
//  SHApp
//
//  Created by Stefan Hitrov on 22.10.20.
//

import UIKit

class NotesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var label: UILabel!
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newNote") as? EntryViewController else { return }
        
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { title , note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: title, note: note))
            self.label.isHidden = true
            self.table.isHidden = false
            
            
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        // Show note controller
        guard let noteVc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else { return }
        noteVc.navigationItem.largeTitleDisplayMode = .never
        noteVc.title = "Note"
        noteVc.title = model.title
        noteVc.note = model.note
        navigationController?.pushViewController(noteVc, animated: true)
    }
    
    
}
