//
//  ViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit
import FirebaseDatabaseInternal

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.ref = Database.database().reference()
        // Do any additional setup after loading the view.
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
         //   self.tableOutlet.reloadData()
          // should only add the student if the student isn’t already in the array
          // good place to update the tableview also

                  
               })

        
        
        AppData.ref.child("shows").observe(.childChanged, with: { (snapshot) in
            
            var s = Show(dict: snapshot.value as! [String : Any])
            s.key = snapshot.key
            //Use a loop to search through the students array for the object with the same key and replace it with the new object
           var i = 0
            while(true){
                if(AppData.shows[i].key == s.key)
                {
                    AppData.shows[i] = s
                    break
                }
                i = i + 1
            }
         
        })
        
        AppData.ref.child("totalShows").observe(.childAdded, with: { (snapshot) in
            // snapshot is a dictionary with a key and a value
            
            // this gets each name from each snapshot
            let n = snapshot.value as! Int
            // adds the name to an array if the name is not already there
            AppData.totalShows = n
            
        })
        
        
        
        
    }


}

