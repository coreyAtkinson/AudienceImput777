//
//  AdminViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var updateOutlet: UITextField!
    @IBOutlet weak var topicOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        topicOutlet.text = AppData.shows[AppData.index].currentTopic
        print("where are we rn???? \(AppData.index)")
        // Do any additional setup after loading the view.
        
       
            
            
            
            
            
        
        
        
        
        
    }
    

    @IBAction func updateAction(_ sender: UIButton) {
        var text = updateOutlet.text!
        
        AppData.shows[AppData.index].currentTopic = text
        print("did the topic change?????:    \(AppData.shows[AppData.index].currentTopic)")
        
        
       AppData.shows[AppData.index ].updateFirebase(dict: ["currentTopic": AppData.shows[AppData.index].currentTopic])

        topicOutlet.text = AppData.shows[AppData.index].currentTopic
        
    }
    
    @IBAction func toggleOnAndOffOutlet(_ sender: UIButton) {
        
        
    }
    
}
