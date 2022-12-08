//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var selectedTip: String?
    
    var tipDecimal: Float?
    
    var totalSplits: Int?
    
    var billTotal: Float?
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    

    // one of the tip buttons is selected
    @IBAction func tipChnaged(_ sender: UIButton) {
        
        billTextField.endEditing(true) // dismisses the keyboard when a tip button is selected
        
        selectedTip = sender.currentTitle  // selected tip
        
        // calling method to see which button was selected
        let tip = calculatorBrain.selectedTipButton(selectedTip: selectedTip ?? "10%")
        
        switch tip {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipDecimal = calculatorBrain.tipDecimal(tip: tip)  // getting tip as a decimal
        
        case "10%":
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipDecimal = calculatorBrain.tipDecimal(tip: tip)  // getting tip as a decimal
            
        case "20%":
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            
            tipDecimal = calculatorBrain.tipDecimal(tip: tip)  // getting tip as a decimal
            
        default:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipDecimal = calculatorBrain.tipDecimal(tip: tip)  // getting tip as a decimal
        }
        
    }

    // when the number of people spliting is changed
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        totalSplits = Int(stepper.value)
        
        splitNumberLabel.text = String(Int(stepper.value))
        
    }
    
    // calculate button is pressed
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        billTotal = Float(billTextField.text ?? "0.0")
        
        calculatorBrain.calculateSplit(totalBill: billTotal ?? 0.0, tipPercentage: tipDecimal ?? 1.10, totalSplits: totalSplits ?? 2)
        
        // navigating to next screen using identifier we called goToResults
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    // preparing information which will go to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if identifier is equal to the identifier we linked to the results screen
        if segue.identifier == "goToResults" {
            
            // destination view controller
            let destinationVC = segue.destination as! ResultsViewController
            
            // getting the respective bill split result information to display on next page
            destinationVC.calculatedResult = calculatorBrain.getCalculatedResult()
            destinationVC.numberOfPeople = calculatorBrain.getNumberOfPeople()
            destinationVC.tipPercentage = calculatorBrain.getTipPercentage()
            
        }
    }
    
    
}

