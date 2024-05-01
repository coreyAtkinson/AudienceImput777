//
//  ViewController22.swift
//  AudienceImput
//
//  Created by OLIVIA MENDEZ on 4/24/24.
//

import UIKit

class ViewController22: UIViewController {

    @IBOutlet weak var textOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

  
    @IBAction func buttonAction(_ sender: UIButton) {
        var hello = 0
        while(hello < AppData.totalShows)
        {
            if textOutlet.text == AppData.shows[hello].admin
            {
                AppData.index = AppData.shows[hello].indexInArray - 1
            }
            else
            {
                AppData.index = -1
            }
            hello = hello + 1
        }
        if AppData.index == -1
        {
            print("show not found")
        }
        else{
            print("show: \(AppData.shows[AppData.index].name)")
            performSegue(withIdentifier: "toYass", sender: self)
        }
    }
    
}
