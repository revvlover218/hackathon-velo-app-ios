//
//  LoadingIndicatorView.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/02.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class LoadingIndicatorView: UIView {
    
    private var backgroundLayer = CALayer()
    private var animator = UIActivityIndicatorView(style: .large)
    private var screenBounds: CGRect {
        let bounds = UIScreen.main.bounds
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAnimatorView()
        drawBackgroundLayer()
        animateView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureAnimatorView() {
        animator.hidesWhenStopped = true
        animator.frame = screenBounds
        self.addSubview(animator)
        animator.startAnimating()
    }
    
    private func drawBackgroundLayer() {
        backgroundLayer.frame = screenBounds
        backgroundLayer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundLayer.opacity = 0.2
        self.layer.addSublayer(backgroundLayer)
    }
    
    private func animateView() {
        self.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    func stopAnimating() {
        animator.stopAnimating()
        self.alpha = 1
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}
