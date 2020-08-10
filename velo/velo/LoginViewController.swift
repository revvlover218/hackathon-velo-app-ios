//
//  LoginViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/10.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet var spinnerImageView: UIImageView!
    @IBOutlet var foregroundImageView: UIImageView!
    @IBOutlet var layeredView: UIView!
    @IBOutlet var registerButton: RoundedSquareButton!
    @IBOutlet var loginButton: RoundedSquareButton!
    @IBOutlet var continueWithoutRegistrationButton: RoundedSquareButton!
    
    @IBOutlet var layeredViewHeightConstraint: NSLayoutConstraint!
    var originalHeight: CGFloat = 270
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateLayeredView()
    }
    
    // MARK: - IBOutlet
    
    @IBAction func registerButtonTapped(_ sender: RoundedSquareButton) {
    }
    
    @IBAction func loginButtonTapped(_ sender: RoundedSquareButton) {
    }
    
    @IBAction func noRegistrationButtonTapped(_ sender: RoundedSquareButton) {
    }

    // MARK: - Touch button Animations
    
    @IBAction private func touchedDown(with sender: RoundedSquareButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @IBAction private func touchCancelled(with sender: RoundedSquareButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    // MARK: - Private
    private func configureUI() {
        invertSpinnerImageColor()
        originalHeight = layeredViewHeightConstraint.constant
        layeredViewHeightConstraint.constant = 0
        layeredView.layer.cornerRadius = 25
        registerButton.alpha = 0
        loginButton.alpha = 0
        continueWithoutRegistrationButton.alpha = 0
    }
    
    private func invertSpinnerImageColor() {
        if let spinnerImage = spinnerImageView.image {
            let originalImage = CIImage(image: spinnerImage)
            let filter = CIFilter(name: "CIColorInvert")
            filter?.setValue(originalImage, forKey: kCIInputImageKey)
            let invertedImage = UIImage(ciImage: (filter?.outputImage)!)
            spinnerImageView.image = invertedImage
        }
    }
}

extension LoginViewController {
    
    private func animateLayeredView() {
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 8,
                       options: [.curveEaseInOut],
                       animations: {
                        self.layeredViewHeightConstraint.constant = self.originalHeight
                        self.view.layoutIfNeeded()
        }) { (finished) in
            if (finished) {
                UIView.animate(withDuration: 0.6,
                               animations: {
                                self.registerButton.alpha = 1
                                self.loginButton.alpha = 1
                                self.continueWithoutRegistrationButton.alpha = 1
                }) { (finished) in
                    self.startSpinnerViewAnimation()
                }
            }
        }
    }
    
    private func startSpinnerViewAnimation() {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 5,
                       options: [.curveEaseInOut, .repeat, .autoreverse],
                       animations: {
                        self.spinnerImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }) { (_) in
        }
    }
    

}
