//
//  SugestViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit

class SugestViewController: UIViewController {
    var counter = 10

    @IBOutlet weak var cooldownOutlet: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var newSuggestionOutlet: UITextField!
    @IBOutlet weak var dispayCurrentTopicOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(AppData.shows[AppData.i].currentTopic)
        
        dispayCurrentTopicOutlet.text = AppData.shows[AppData.i].currentTopic
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addAction(_ sender: UIButton) {
        
//    if(AppData.pause == true){ // Olivia
//
//            addButtonOutlet.isEnabled = false
//            AppData.pause == false
//            
//        }
//        
     //  else{
            
            var text = newSuggestionOutlet.text!
            counter = 10
            AppData.shows[AppData.i].responces.append(text)
            
            AppData.shows[AppData.i].updateFirebase(dict: ["responces": AppData.shows[AppData.i].responces])
            newSuggestionOutlet.text = ""
            addButtonOutlet.isEnabled = false
            //  cooldownOutlet.text = "wait 10 seconds before next sugestion!"
            var t = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { _ in
                self.addButtonOutlet.isEnabled = true
                self.cooldownOutlet.text = " "
                
            })
            
            // make an if statement to check if pause is true and will disable add action - Olivia
            
      //  }
        
    }
    
   
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            cooldownOutlet.text = "cooldown: \(counter) sec"
            counter -= 1
        }
        print("counting")
       
    }

    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        
        dispayCurrentTopicOutlet.text = AppData.shows[AppData.i].currentTopic
        
        
        
    }
}
