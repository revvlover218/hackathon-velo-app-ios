//
//  CustomUIView.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUIView: UIView {

    @IBInspectable var roundedCorners: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = roundedCorners
        }
    }
    
    @IBInspectable var shouldAddShadow: Bool = false {
        didSet{
            if shouldAddShadow {
                addShadow()
            }
        }
    }
    
    @IBInspectable var shouldMakeCircle: Bool = false {
        didSet{
            if shouldMakeCircle {
                makeCircle()
            }
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
    
    private func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 25
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func makeCircle() {
        self.layer.cornerRadius = self.frame.width / 2
    }
}
