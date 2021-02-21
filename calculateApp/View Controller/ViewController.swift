//
//  ViewController.swift
//  calculateApp
//
//  Created by Akdag on 21.02.2021.
//

import UIKit

class ViewController: UIViewController {
    private var finishTypingNumber : Bool = true
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                if displayLabel.text! == "Error"{
                    return 0
                }else{
                    fatalError("Cannot conver Double")
                }
            }
           return number
        }
        set{
            if newValue.isInfinite {
                displayLabel.text = "Error"
            }else{
                if floor(newValue) == newValue{
                    displayLabel.text = String(format: "%.0f", newValue)
                }else{
                    displayLabel.text = String(newValue)
                    
                }
            }
        }
    }
    private var calculator = CalculatorLogic()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateSymbol(_ sender: UIButton) {
        finishTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
        }
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            if finishTypingNumber {
                displayLabel.text = numberValue
                finishTypingNumber = false
            }else{
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
    

}

