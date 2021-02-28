//
//  FirstViewController.swift
//  Calculator App Final
//
//  Created by Jordan Sun on 10/13/19.
//  Copyright © 2019 Jordan Sun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
   
    @IBOutlet weak var decimal: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var subtract: UIButton!
    @IBOutlet weak var add: UIButton!
    
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if (performingMath == true){
            if (Label.text == "0."){
                Label.text = Label.text! + String(sender.tag-1)
                numberOnScreen = Double(Label.text!)!
            }
            else{
            Label.text = String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
            }
        }
        
        else {
            if (Label.text == "0"){
                Label.text = String(sender.tag-1)
                numberOnScreen = Double(Label.text!)!
            }
            else {
            Label.text = Label.text! + String(sender.tag-1);
            numberOnScreen = Double(Label.text!)!
            }
        }
    }

    @IBAction func decimal(_ sender: UIButton) {
        let arrayFormat = Array(Label.text!)
        
//        var n = 0
//        while arrayFormat[n] != "." {
//            decimal.isEnabled = true
//            n += 1
//        }
//        decimal.isEnabled = false
        
        for n in Label.text!{
           if (n == "."){
                decimal.isEnabled = false
                break
           }
           else {
               decimal.isEnabled = true
           }
        }
        
        if (Label.text == "+"||Label.text == "-"||Label.text == "×"||Label.text == "÷"){
            decimal.isEnabled = false
        }
            
        else if (arrayFormat.isEmpty){
            decimal.isEnabled = false
        }
        
        else {
            Label.text = Label.text! + "."
        }
        sender.isEnabled = false
        
    }
    
    @IBAction func calculations(_ sender: UIButton) {
        
        if (sender.tag == 12){
            Label.text = String(numberOnScreen * -1)
            numberOnScreen = Double(Label.text!)!
        }
        else if (sender.tag == 13){
            Label.text = String(numberOnScreen/100)
            numberOnScreen = Double(Label.text!)!
        }
        
        else if (sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18){
            
            previousNumber = Double(Label.text!)!;
            
            if (sender.tag == 14){ //divide
                Label.text = "÷"
            }
            else if (sender.tag == 15){ //multiply
                Label.text = "×"
            }
            else if (sender.tag == 16){ //subtract
                Label.text = "-"
            }
            else if (sender.tag == 17){ //add
                Label.text = "+"
            }
            if (Label.text == "÷" || Label.text == "×" || Label.text == "-" || Label.text == "+"){
                divide.isEnabled = false
                multiply.isEnabled = false
                subtract.isEnabled = false
                add.isEnabled = false
            }
            else {
                divide.isEnabled = true
                multiply.isEnabled = true
                subtract.isEnabled = true
                add.isEnabled = true
            }
            decimal.isEnabled = true
        
            operation = sender.tag
            performingMath = true
            
        }
        else if (sender.tag == 18){ //equal sign
            if (operation == 14){
                Label.text = String(previousNumber / numberOnScreen)
            }
            if (operation == 15){
                Label.text = String(previousNumber * numberOnScreen)
            }
            if (operation == 16){
                Label.text = String(previousNumber - numberOnScreen)
            }
            if (operation == 17){
                Label.text = String(previousNumber + numberOnScreen)
            }
            if (previousNumber != 0){
                decimal.isEnabled = true
            }
            else {
                decimal.isEnabled = false
            }
            divide.isEnabled = true
            multiply.isEnabled = true
            subtract.isEnabled = true
            add.isEnabled = true
        }
        else if (sender.tag == 11){ //reset
            Label.text = "0"
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            decimal.isEnabled = true
            divide.isEnabled = true
            multiply.isEnabled = true
            subtract.isEnabled = true
            add.isEnabled = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = "0"
        // Do any additional setup after loading the view.
    }


}


