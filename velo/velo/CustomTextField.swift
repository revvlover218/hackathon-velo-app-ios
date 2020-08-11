//
//  CustomTextField.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

@IBDesignable

class CustomTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
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
