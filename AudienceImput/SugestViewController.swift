//
//  SugestViewController.swift
//  AudienceImput
//
//  Created by COREY ATKINSON on 3/5/24.
//

import UIKit

class SugestViewController: UIViewController {

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

        
        
        
    }
    

    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        
        dispayCurrentTopicOutlet.text = AppData.shows[AppData.i].currentTopic
        
        
        
    }
}
