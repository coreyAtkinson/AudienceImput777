//
//  SugestViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit

class SugestViewController: UIViewController {

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
        var text = newSuggestionOutlet.text!
        
        AppData.shows[AppData.i].responces.append(text)
        
        AppData.shows[AppData.i].updateFirebase(dict: ["responces": AppData.shows[AppData.i].responces])
        newSuggestionOutlet.text = ""
        addButtonOutlet.isEnabled = false
        cooldownOutlet.text = "wait 10 seconds before next sugestion!"
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { _ in
            self.addButtonOutlet.isEnabled = true
            self.cooldownOutlet.text = " "
        })
    }
    
   
    
    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        
        dispayCurrentTopicOutlet.text = AppData.shows[AppData.i].currentTopic
        
        
        
    }
}
