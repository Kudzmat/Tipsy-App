//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Kudzayi  Bamhare on 11/2/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var billSplit: SplitBill? // creating an optional variable of object type SplitBill
    
    
    // this method will check which tip button was selected
    func selectedTipButton(selectedTip: String) -> String {
        
        if selectedTip == "0%" {
           return "0%"
        }
        
        else if selectedTip == "10%" {
            return "10%"
            
        }
        
        else {
            return "20%"
        }
    }
    
    // this method will retun the selected tip as a decimal
    func tipDecimal(tip: String) -> Float {
        switch tip {
        case "0%":
            return 0
        case "10%":
            return (10 / 100) + 1
        case "20%":
            return (20/100) + 1
        default:
            return (10 / 100) + 1
        }
    }
    
    // this method will calculate how much each person needs to pay
    mutating func calculateSplit(totalBill: Float, tipPercentage: Float, totalSplits: Int) {
        
        let splitBill = (totalBill * tipPercentage) / Float(totalSplits)
        
        // instantiate Split Bill
        billSplit = SplitBill(calculatedResult: splitBill, numberOfPeople: Int(totalSplits), tipPercentage: tipPercentage)
        
        print(splitBill)
        
    }
    
    // this method will return the calculated result
    func getCalculatedResult() -> String {
        return String(format: "%.2f", billSplit?.calculatedResult ?? 0.0)
    }
    
    // this method will return the number of people splitting the bill
    func getNumberOfPeople() -> String {
        return String(billSplit?.numberOfPeople ?? 2)
    }
    
    func getTipPercentage() -> String {
        let tip = ((billSplit?.tipPercentage ?? 0) - 1) * 100
        
        return String(Int(tip))
    }
}
