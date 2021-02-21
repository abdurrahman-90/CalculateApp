//
//  Model.swift
//  calculateApp
//
//  Created by Akdag on 21.02.2021.
//

import UIKit

struct CalculatorLogic {
    private var number : Double?
    
    private var intermediaCalculation : (n1 : Double , calcMethod : String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    mutating func calculate(symbol : String)-> Double?{
        if let num = number {
            switch symbol {
            case "+/-":
                return num * -1
            case "AC":
                return 0
            case "%":
                return num * 0.01
            case "=" :
                return TwoNumberCalculate(n2 : num)
            default :
                intermediaCalculation = (n1 : num , calcMethod : symbol)
            }
            
        }
        return nil
    }
    private func TwoNumberCalculate(n2 : Double) -> Double? {
        if let n1 = intermediaCalculation?.n1,
           let calcMethod = intermediaCalculation?.calcMethod {
            
            switch calcMethod {
            case "+":
                return n1 + n2
            case "-" :
                return n1 - n2
            case "X":
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("System Error")
            }
        }
        return nil
        
    }
    
    
}
