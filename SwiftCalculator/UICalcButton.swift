//
//  CalcButton.swift
//  SwiftCalculator
//
//  Created by JD Maresco on 2/16/15.
//  Copyright (c) 2015 Maresco. All rights reserved.
//

import UIKit

class UICalcButton: UIButton {
    
    var label = UILabel()
    var bgColor: UIColor = UIColor.lightGrayColor() {
        willSet {
            self.backgroundColor = newValue
        }
    }
    
    var bgColorClicked: UIColor = UIColor.grayColor()
    
    let borderColorOperatorSelected: UIColor = UIColor.blackColor()
    
    init(label labelText: String, bgColor bg: UIColor, bgColorClicked bgc: UIColor) {
        
        super.init()
        initButton()
        
        self.bgColor = bg
        self.bgColorClicked = bgc
        self.label.text = labelText
        
        // Set background color of view (since willSet doesn't get called from within initializer.
        self.backgroundColor = bg
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        self.label.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.label)

        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: nil, metrics: nil, views: ["label": self.label]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: nil, metrics: nil, views: ["label": self.label]))
        
        self.label.textColor = UIColor.blackColor()
        self.label.font = UIFont(name: "Helvetica Light", size: 34)
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 0.6
        self.label.textAlignment = .Center
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.backgroundColor = self.bgColorClicked
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.backgroundColor = self.bgColor
        })
    }
    
}
