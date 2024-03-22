//
//  SeeResponcesViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit

class SeeResponcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var r = [String]()
    @IBOutlet weak var tableOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
        while i < AppData.shows[AppData.index].responces.count
        {
            r.append(AppData.shows[AppData.index].responces[i])
            
            i = i + 1
            
            
            
            
        }
        
        
        tableOutlet.dataSource = self
        tableOutlet.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shows[AppData.index].responces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        
        
        cell.textLabel?.text = AppData.shows[AppData.index].responces[indexPath.row]
     
        return cell
    }

    @IBAction func refreshOutlet(_ sender: UIButton) {
        
        tableOutlet.reloadData()
    }
    
}
