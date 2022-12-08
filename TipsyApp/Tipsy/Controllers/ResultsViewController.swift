//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kudzayi  Bamhare on 11/1/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var calculatedResult: String?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between \(numberOfPeople ?? "2") people, with \(tipPercentage ?? "0%")% tip."

        // Do any additional setup after loading the view.
    }
    
    // recalculate button pressed
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)  // dismisses the view controller that was presented 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
