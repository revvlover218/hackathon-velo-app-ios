//
//  CustomUIImageView.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUIImageView: UIImageView {
    
    @IBInspectable var roundedCorners: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = roundedCorners
            self.layer.masksToBounds = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
