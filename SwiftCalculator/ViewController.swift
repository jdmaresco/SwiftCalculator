//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by JD Maresco on 2/16/15.
//  Copyright (c) 2015 Maresco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var resultsLabel =          UILabel()
        var resultsLabelSpacer =    UIView()
        
        var clearButton =           UICalcButton(label: "C",    bgColor: UIColor.grayColor(), bgColorClicked: UIColor.darkGrayColor())
          var plusMinusButton =     UICalcButton(label: "+/-",  bgColor: UIColor.grayColor(), bgColorClicked: UIColor.darkGrayColor())
            var percentButton =     UICalcButton(label: "%",    bgColor: UIColor.grayColor(), bgColorClicked: UIColor.darkGrayColor())
              var divideButton =    UICalcButton(label: "÷",    bgColor: UIColor.orangeColor(), bgColorClicked: UIColor.brownColor())
        var sevenButton =           UICalcButton(label: "7",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
          var eightButton =         UICalcButton(label: "8",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
            var nineButton =        UICalcButton(label: "9",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
              var timesButton =     UICalcButton(label: "x",    bgColor: UIColor.orangeColor(), bgColorClicked: UIColor.brownColor())
        var fourButton =            UICalcButton(label: "4",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
          var fiveButton =          UICalcButton(label: "5",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
            var sixButton =         UICalcButton(label: "6",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
              var minusButton =     UICalcButton(label: "-",    bgColor: UIColor.orangeColor(), bgColorClicked: UIColor.brownColor())
        var oneButton =             UICalcButton(label: "1",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
          var twoButton =           UICalcButton(label: "2",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
            var threeButton =       UICalcButton(label: "3",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
              var plusButton =      UICalcButton(label: "+",    bgColor: UIColor.orangeColor(), bgColorClicked: UIColor.brownColor())
        var zeroButton =            UICalcButton(label: "0",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
            var periodButton =      UICalcButton(label: ".",    bgColor: UIColor.lightGrayColor(), bgColorClicked: UIColor.grayColor())
              var equalButton =     UICalcButton(label: "=",    bgColor: UIColor.orangeColor(), bgColorClicked: UIColor.brownColor())
        
        for button in [resultsLabel,resultsLabelSpacer,clearButton,plusMinusButton,percentButton,divideButton,sevenButton,eightButton,nineButton,timesButton,fourButton,fiveButton,sixButton,minusButton,oneButton,twoButton,threeButton,plusButton,zeroButton,periodButton,equalButton] {
            
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.view.addSubview(button)

        }
        
        // HORIZONTAL LAYOUT
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label][spacer(==15)]|", options: nil, metrics: nil, views: ["label": resultsLabel, "spacer": resultsLabelSpacer]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": clearButton, "b": plusMinusButton, "c": percentButton, "d": divideButton]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": sevenButton, "b": eightButton, "c": nineButton, "d": timesButton]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": fourButton, "b": fiveButton, "c": sixButton, "d": minusButton]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][b(==a)][c(==a)][d(==a)]|", options: nil, metrics: nil, views: ["a": oneButton, "b": twoButton, "c": threeButton, "d": plusButton]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[a][c][d]|", options: nil, metrics: nil, views: ["a": zeroButton, "c": periodButton, "d": equalButton]))
        self.view.addConstraint(NSLayoutConstraint(item: zeroButton, attribute: .Width, relatedBy: .Equal, toItem: periodButton, attribute: .Width, multiplier: 2, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: zeroButton, attribute: .Width, relatedBy: .Equal, toItem: equalButton, attribute: .Width, multiplier: 2, constant: 0))
        
        // VERTICAL LAYOUT
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": resultsLabel, "a": clearButton, "b": sevenButton, "c": fourButton, "d": oneButton, "e": zeroButton, "tlg": topLayoutGuide]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": resultsLabel, "a": plusMinusButton, "b": eightButton, "c": fiveButton, "d": twoButton, "e": zeroButton, "tlg": topLayoutGuide]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": resultsLabel, "a": percentButton, "b": nineButton, "c": sixButton, "d": threeButton, "e": periodButton, "tlg": topLayoutGuide]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg][label(==a)][a][b(==a)][c(==a)][d(==a)][e(==a)]|", options: nil, metrics: nil, views: ["label": resultsLabel, "a": divideButton, "b": timesButton, "c": minusButton, "d": plusButton, "e": equalButton, "tlg": topLayoutGuide]))

        resultsLabel.text = "0"
        resultsLabel.textColor = UIColor.blackColor()
        resultsLabel.font = UIFont(name: "Helvetica Light", size: 34)
        resultsLabel.textAlignment = .Right
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

