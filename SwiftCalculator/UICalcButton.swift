//
//  CalcButton.swift
//  SwiftCalculator
//
//  Created by JD Maresco on 2/16/15.
//  Copyright (c) 2015 Maresco. All rights reserved.
//

import UIKit


// UICalcButton subclasses UIView, not UIButton, but a UIButton is instantiated and added to this UIView.
// This remediated issues I was having with using .addTarget() on a subclass of UIButton.

class UICalcButton: UIView {
    
    var button = UIButton()
    var label = UILabel()
    var btnType = buttonType.none
    var bgColor: UIColor = UIColor.lightGrayColor() {
        willSet {
            // Make sure button background gets updated whenever bgColor is updated
            self.button.backgroundColor = newValue
        }
    }
    
    var bgColorClicked: UIColor = UIColor.grayColor()
    
    let borderColorOperatorSelected: UIColor = UIColor.blackColor()
    
    init(label labelText: String, bgColor bg: UIColor, bgColorClicked bgc: UIColor, button: buttonType) {
        
        super.init()
        initButton()
        
        self.bgColor = bg
        self.bgColorClicked = bgc
        self.label.text = labelText
        self.btnType = button
        
        // Set background color of view (since willSet doesn't get called from within initializer.)
        self.button.backgroundColor = bg
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
        self.button.setTranslatesAutoresizingMaskIntoConstraints(false)

        self.addSubview(self.button)
        self.button.addSubview(self.label)
        
        // Layout buttons within view
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[button]|", options: nil, metrics: nil, views: ["button": self.button]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[button]|", options: nil, metrics: nil, views: ["button": self.button]))
        
        // Layout labels within buttons
        
        self.button.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: nil, metrics: nil, views: ["label": self.label]))
        self.button.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: nil, metrics: nil, views: ["label": self.label]))
        
        // Style view and button label
        
        self.label.textColor = UIColor.blackColor()
        self.label.font = UIFont(name: "Helvetica Light", size: 34)
        self.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.layer.borderWidth = 0.5
        self.label.textAlignment = .Center
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.button.backgroundColor = self.bgColorClicked
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.button.backgroundColor = self.bgColor
        })
    }
    
}
