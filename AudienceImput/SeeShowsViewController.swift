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
        
        let alertController = UIAlertController(title: "Enter password for \(AppData.shows[AppData.i].name)", message: "", preferredStyle: .alert)
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Enter Password"
            }
            let saveAction = UIAlertAction(title: "Enter", style: .default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                if firstTextField.text == AppData.shows[AppData.i].pass
                {
                    print("correct password")
                    self.performSegue(withIdentifier: "toAddStuff", sender: nil)
                }
                else
                {
                    print("wrong password")
                
                    
                    let alertController2 = UIAlertController(title: "Password is wrong! Can't sign into \(AppData.shows[AppData.i].name)...", message: "", preferredStyle: .alert)
                    
                    let okayAction = UIAlertAction(title: "Okay", style: .default, handler: { (action : UIAlertAction!) -> Void in })
                    
                    
                    
                    alertController2.addAction(okayAction)
                    self.present(alertController2, animated: true, completion: nil)
                    
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
          //  alertController.addTextField { (textField : UITextField!) -> Void in
          //      textField.placeholder = "Enter First Name"
          //  }

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
            
        
            self.present(alertController, animated: true, completion: nil)
    
        
        
      //  performSegue(withIdentifier: "toAddStuff", sender: nil)
        
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
