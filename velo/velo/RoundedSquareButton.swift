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
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
