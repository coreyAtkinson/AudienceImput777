//
//  AddShowViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

 class AppData
{
  static var shows = [Show]()
     static var totalShows = 0
     static var index = 0
     static var ref: DatabaseReference!
     static var i = 0
     static var updated = false
     static var pause = false // Olivia 

}



class Show {
    var name : String
    var pass : String
    var currentTopic : String
    var responces = [String]()
    var isActive = false
    var indexInArray : Int
    var ref = Database.database().reference()
    var key = ""
    
    //here is the admin password
    var admin : String
    
    init(name: String, pass: String, currentTopic: String, responces: [String] = [String](), isActive: Bool = true, indexInArray : Int, admin: String){
        self.name = name
        self.pass = pass
        self.currentTopic = currentTopic
        self.responces = responces
        self.isActive = isActive
        self.indexInArray = indexInArray
        self.admin = admin
    }
    
    init(dict: [String : Any]) {
        if let n = dict["name"] as? String{
            name = n
        }
        else{
           name  = "John Show"
        }
       
        if let p = dict["pass"] as? String {
            pass = p
        }
        else
        {
            pass = "12345"
        }
        if let c = dict["currentTopic"] as? String {
            currentTopic = c
        }
        else
        {
            currentTopic = "no topic"
        }
        if let r = dict["responces"] as? [String] {
            responces = r
        }
        else
        {
            responces = ["none", "sad"]
        }
        if let i = dict["isActive"] as? Bool {
            isActive = i
        }
        else
        {
            isActive = false
        }
        if let ind = dict["indexInArray"] as? Int {
            indexInArray = ind
        }
        else
        {
            indexInArray = -1
        }
     //new admin added
            if let a = dict["admin"] as? String{
               admin = a
            }
        else{
            admin = "no admin found"
        }
        
    }
    
    
    func saveToFirebase() {
        let dict = ["name": name, "pass":pass, "currentTopic": currentTopic, "responces": responces, "isActive": isActive, "indexInArray": indexInArray, "admin": admin] as [String: Any]
var yay = ref.child("shows").childByAutoId()
        ref.child("shows").child(yay.key!).setValue(dict)

        key = yay.key!
        print("SAVE key: \(key)")
        
        AppData.updated = true
    }
    
    func deleteFromFirebase(){
            ref.child("shows").child(key).removeValue()
        }
    
    func updateFirebase(dict: [String: Any]){
        print("key: \(key)")
        print("name of show: \(name)")
           ref.child("shows").child(key).updateChildValues(dict)
        AppData.updated = true
       }

    
}
class AddShowViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var passOutlet: UITextField!
    @IBOutlet weak var adminOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        

        /*
        AppData.ref.child("s").observe(.childAdded, with: { (snapshot) in
            // snapshot is a dictionary with a key and a dictionary as a value
                      // this gets the dictionary from each snapshot
                      let dict = snapshot.value as! [String:Any]
                     
                      // building a Student object from the dictionary
                      let s = Show(dict: dict)
            s.key = snapshot.key
                      // adding the student object to the Student array
            AppData.shows.append(s)
            print("\(s.name) \(s.key)")
                      
          // should only add the student if the student isn’t already in the array
          // good place to update the tableview also

                  
               })

        */
        
        
        
      
    }
    
    @IBAction func addShow(_ sender: UIButton) {
        
        AppData.totalShows = AppData.totalShows + 1
        
        AppData.ref.child("totalShows").childByAutoId().setValue(AppData.totalShows)
        //okay you need to add a new text outlet to add
        var s = Show(name: nameOutlet.text!, pass: passOutlet.text!, currentTopic: "no topic added", responces: ["test responce 1", "test responce 2"], indexInArray: AppData.totalShows, admin: adminOutlet.text!)
      //  AppData.shows.append(s)
        s.saveToFirebase()

        s.indexInArray = AppData.totalShows - 1
      
        AppData.index = s.indexInArray
        print(AppData.index)
        let alertController2 = UIAlertController(title: "Show Added!", message: "", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: { (action : UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "toAdmin", sender: nil)
        })
        
        
        
        alertController2.addAction(okayAction)
        self.present(alertController2, animated: true, completion: nil)
    //    performSegue(withIdentifier: "toAdmin", sender: nil)
        
        adminOutlet.resignFirstResponder()
        
    }
    
   
}
