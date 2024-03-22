//
//  SeeShowsViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit

class SeeShowsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
  
    var timer = Timer()

   

    @IBOutlet weak var tableOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    //    self.timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { _ in
     //       self.updateCounting()
     //   })
        tableOutlet.dataSource = self
        tableOutlet.delegate = self
        
        
        
        /*
        AppData.ref.child("shows").observe(.childAdded, with: { (snapshot) in
            // snapshot is a dictionary with a key and a dictionary as a value
                      // this gets the dictionary from each snapshot
                      let dict = snapshot.value as! [String:Any]
                     print(dict)
                      // building a Student object from the dictionary
                      let s = Show(dict: dict)
            s.key = snapshot.key
                      // adding the student object to the Student array
            AppData.shows.append(s)
            for a in AppData.shows {
                print(a.name)
            }
            self.tableOutlet.reloadData()
          // should only add the student if the student isn’t already in the array
          // good place to update the tableview also

                  
               })
         */

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = AppData.shows[indexPath.row].name
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row: \(indexPath.row)")
        AppData.i = indexPath.row
        
        
        performSegue(withIdentifier: "toAddStuff", sender: nil)
        
    }

 

    func updateCounting(){
        //print("counting...")
        
        if AppData.updated
        {
            tableOutlet.reloadData()
            
            AppData.updated = false
        }
        
        
    }
    
    
    @IBAction func refreshAction(_ sender: UIButton) {
        
        tableOutlet.reloadData()
        
        
        
    }
}
