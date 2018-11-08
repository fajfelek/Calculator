//
//  Calculator.swift
//  Calculator
//
//  Created by Filip Stajniak on 08/11/2018.
//  Copyright © 2018 Filip Stajniak. All rights reserved.
//

import Foundation

class Calculator {
    //Dodawanie, odejmowanie, dzielenie, mnozenie, procent, modulo
    
    func task(num1: Double, num2: Double, task: String) -> Double? {
        switch task {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            if num2 != 0 {
                return num1 / num2
            } else {
                return nil
            }
        case "%":
            if num2 != 0 {
                return (num1 / num2) * 100
            } else {
                return nil
            }
        default:
            print("Nie znam takiego zdania: \(task)")
            return nil
        }
    }
    
}
