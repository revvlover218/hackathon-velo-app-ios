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
    private var loadingIndicatorImage = UIImage(named: "LoadingIndicatorIcon")
    private var loadingIndicatorImageView: UIImageView?
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
        let size = 125
        loadingIndicatorImageView = UIImageView(image: loadingIndicatorImage)
        loadingIndicatorImageView?.frame = CGRect(x: Int(screenBounds.width)/2 - size/2,
                                                  y: Int(screenBounds.height)/2 - size/2,
                                                  width: size,
                                                  height: size)
        self.addSubview(loadingIndicatorImageView!)
        startSpinnerViewAnimation()
    }
    
    private func drawBackgroundLayer() {
        backgroundLayer.frame = screenBounds
        backgroundLayer.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
        backgroundLayer.opacity = 0.5
        self.layer.addSublayer(backgroundLayer)
    }
    
    private func animateView() {
        self.alpha = 0
        UIView.animate(withDuration: 0.7) {
            self.alpha = 1
        }
    }
    
    func startSpinnerViewAnimation() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 6,
                       options: [.curveEaseInOut, .repeat, .autoreverse],
                       animations: {
                        self.loadingIndicatorImageView?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }) { (_) in
        }
    }
    
    func stopAnimating() {
        self.alpha = 1
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}
