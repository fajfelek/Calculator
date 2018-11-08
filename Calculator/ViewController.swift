//
//  ViewController.swift
//  Calculator
//
//  Created by Filip Stajniak on 28/10/2018.
//  Copyright © 2018 Filip Stajniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var onLCD : String = ""
    var number1 : String = ""
    var number2 : String = ""
    var result : String = ""
    var calculate = Calculator()
    var dotCounter : Int = 0
    var newNumber : Bool = false
    
    var task : String = ""

    @IBOutlet weak var lcdOut: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numbersAction(_ sender: UIButton) {
        var tag = ""
        print(newNumber)
        if newNumber {
            onLCD = ""
            lcdOut.text = ""
            newNumber = false
            dotCounter = 0
        }
        if sender.tag == 100 {
            tag = "."
            dotCounter = dotCounter + 1
        } else {
            tag = String(sender.tag)
        }
        if !(dotCounter > 1 && sender.tag == 100) {
            onLCD.append(tag)
            lcdOut.text = onLCD
        }
    }
    @IBAction func keysFunctionAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 101:
            number2 = lcdOut.text!
            if number1 == "" {
                lcdOut.text = number2
            } else {
                let result = calculate.task(num1: Double(number1)!, num2: Double(number2)!, task: task)
                self.result = String(result!)
                print(self.result)
                lcdOut.text = numberFormater(self.result)
            }
            newNumber = true
        case 102:
            task = "+"
            number1 = lcdOut.text!
            newNumber = true
        case 103:
            task = "-"
            number1 = lcdOut.text!
            newNumber = true
        case 104:
            task = "*"
            number1 = lcdOut.text!
            newNumber = true
        case 105:
            task = "/"
            number1 = lcdOut.text!
            newNumber = true
        case 106:
            guard let num = Double(lcdOut.text!) else {
                lcdOut.text = ""
                return
            }
            lcdOut.text = String(num / 100)
        case 107:
            guard let num : String = lcdOut.text else {
                lcdOut.text = ""
                return
            }
            var changeNum : String = ""
            if num.prefix(1) == "-" {
                changeNum = num[1..<num.count]
            } else {
                changeNum = "-" + num
            }
            
            lcdOut.text = changeNum
            
        case 108:
            lcdOut.text = "0"
            number1 = ""
            number2 = ""
            result = ""
            newNumber = true
            dotCounter = 0
        default:
            print("nothing")
        }
    }
    func numberFormater(_ value: String?) -> String {
        guard value != nil else { return "0" }
        let doubleValue = Double(value!) ?? 0.0
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = (value!.contains(".0")) ? 0 : 2
        formatter.maximumFractionDigits = (value?.count)!
        return formatter.string(from: NSNumber(value: doubleValue)) ?? "\(doubleValue)"
    }
}

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
