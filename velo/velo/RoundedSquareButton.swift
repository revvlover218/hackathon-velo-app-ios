//
//  RoundedSquareButton.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/04.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

@IBDesignable

class RoundedSquareButton: UIButton {
    
    @IBInspectable var test: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = test
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setBackgroundColor()
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
     func setBackgroundColor() {
        self.backgroundColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
    }
    
}
