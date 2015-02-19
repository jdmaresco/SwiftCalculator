//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by JD Maresco on 2/16/15.
//  Copyright (c) 2015 Maresco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mainCalculation: Calculation = Calculation()
    var resultsLabel =          UILabel()
    var resultsLabelSpacer =    UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize individual buttons (which are actually subclassed to UIView and contain a UIButton inside them)
        
            var clearButton =         UICalcButton(label: "C",    bgColor: UIColor.grayColor(),       bgColorClicked: UIColor.darkGrayColor(),  button: .clear)
            var plusMinusButton =     UICalcButton(label: "+/-",  bgColor: UIColor.grayColor(),       bgColorClicked: UIColor.darkGrayColor(),  button: .plusMinus)
            var percentButton =       UICalcButton(label: "%",    bgColor: UIColor.grayColor(),       bgColorClicked: UIColor.darkGrayColor(),  button: .percent)
                  var divideButton =  UICalcButton(label: "÷",    bgColor: UIColor.orangeColor(),     bgColorClicked: UIColor.brownColor(),     button: .dividedBy)
            var sevenButton =         UICalcButton(label: "7",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .seven)
              var eightButton =       UICalcButton(label: "8",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .eight)
                var nineButton =      UICalcButton(label: "9",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .nine)
                  var timesButton =   UICalcButton(label: "x",    bgColor: UIColor.orangeColor(),     bgColorClicked: UIColor.brownColor(),     button: .times)
            var fourButton =          UICalcButton(label: "4",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .four)
              var fiveButton =        UICalcButton(label: "5",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .five)
                var sixButton =       UICalcButton(label: "6",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .six)
                  var minusButton =   UICalcButton(label: "-",    bgColor: UIColor.orangeColor(),     bgColorClicked: UIColor.brownColor(),     button: .minus)
            var oneButton =           UICalcButton(label: "1",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .one)
              var twoButton =         UICalcButton(label: "2",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .two)
                var threeButton =     UICalcButton(label: "3",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .three)
                  var plusButton =    UICalcButton(label: "+",    bgColor: UIColor.orangeColor(),     bgColorClicked: UIColor.brownColor(),     button: .plus)
            var zeroButton =          UICalcButton(label: "0",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .zero)
                var periodButton =    UICalcButton(label: ".",    bgColor: UIColor.lightGrayColor(),  bgColorClicked: UIColor.grayColor(),      button: .period)
                  var equalButton =   UICalcButton(label: "=",    bgColor: UIColor.orangeColor(),     bgColorClicked: UIColor.brownColor(),     button: .equals)
        
        
        // Add event handlers to all the buttons on screen
        
            for btn in [clearButton,plusMinusButton,percentButton,divideButton,sevenButton,eightButton,nineButton,timesButton,fourButton,fiveButton,sixButton,minusButton,oneButton,twoButton,threeButton,plusButton,zeroButton,periodButton,equalButton] {
                
                // Deal with button presses (will get passed along to an instance of the Calculation class for handling)
                
                    btn.button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchDown)
                
            }
        
        // Add all the views (including buttons) to the screen
        
            for view in [resultsLabel,resultsLabelSpacer,clearButton,plusMinusButton,percentButton,divideButton,sevenButton,eightButton,nineButton,timesButton,fourButton,fiveButton,sixButton,minusButton,oneButton,twoButton,threeButton,plusButton,zeroButton,periodButton,equalButton] {
                
                view.setTranslatesAutoresizingMaskIntoConstraints(false)
                self.view.addSubview(view)
            }
        
        // HORIZONTAL layout of views on screen
        
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label][spacer(==15)]|", options: nil, metrics: nil, views: ["label": self.resultsLabel, "spacer": resultsLabelSpacer]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": clearButton, "b": plusMinusButton, "c": percentButton, "d": divideButton]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": sevenButton, "b": eightButton, "c": nineButton, "d": timesButton]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": fourButton, "b": fiveButton, "c": sixButton, "d": minusButton]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": oneButton, "b": twoButton, "c": threeButton, "d": plusButton]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][c][d]|", options: nil, metrics: nil, views: ["a": zeroButton, "c": periodButton, "d": equalButton]))
            self.view.addConstraint(NSLayoutConstraint(item: zeroButton, attribute: .Width, relatedBy: .Equal, toItem: periodButton, attribute: .Width, multiplier: 2, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: zeroButton, attribute: .Width, relatedBy: .Equal, toItem: equalButton, attribute: .Width, multiplier: 2, constant: 0))
        
        // VERTICAL layout of views on screen
        
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": self.resultsLabel, "a": clearButton, "b": sevenButton, "c": fourButton, "d": oneButton, "e": zeroButton, "tlg": topLayoutGuide]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": self.resultsLabel, "a": plusMinusButton, "b": eightButton, "c": fiveButton, "d": twoButton, "e": zeroButton, "tlg": topLayoutGuide]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": self.resultsLabel, "a": percentButton, "b": nineButton, "c": sixButton, "d": threeButton, "e": periodButton, "tlg": topLayoutGuide]))
        
            // This constraint lays out the resultsLabelSpacer rather than the resultsLabel to make sure the spacer has a height and actually shows up 
        
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][spacer(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["spacer": self.resultsLabelSpacer, "a": divideButton, "b": timesButton, "c": minusButton, "d": plusButton, "e": equalButton, "tlg": topLayoutGuide]))
        
        // Style the screen that displays results
        
            self.resultsLabel.text = "0"
            self.resultsLabel.backgroundColor = UIColor.darkGrayColor()
            self.resultsLabelSpacer.backgroundColor = UIColor.darkGrayColor()
            self.resultsLabel.textColor = UIColor.whiteColor()
            self.resultsLabel.font = UIFont(name: "Helvetica Light", size: 48)
            self.resultsLabel.textAlignment = .Right
        
        // Subscribe to notifications from the calculation class
        
            var notifications: NSNotificationCenter = NSNotificationCenter.defaultCenter()
            notifications.addObserver(self, selector: "updateScreen:", name: "operandChanged", object: mainCalculation)
    }

    // Handle button presses and pass them on to an instance of the Calculation class
    
    func buttonClicked(sender: UIButton!) {
        if let btnSuperView = (sender.superview as? UICalcButton) {
            let btnType = btnSuperView.btnType
            mainCalculation.registerClick(btnType)
        }
    }
    
    // Respond to values sent via NSNotification from an instance of the Calculation class
    // Update the screen appropriately with the data sent in userInfo
    
    func updateScreen(sender: NSNotification) {
        if let userInfo = sender.userInfo as? Dictionary<String, String> {
            if let contents = userInfo["contents"] {
                self.resultsLabel.text = contents
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

