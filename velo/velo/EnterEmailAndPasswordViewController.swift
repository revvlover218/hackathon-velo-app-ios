//
//  EnterEmailAndPasswordViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class EnterEmailAndPasswordViewController: BaseViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var logoView: CustomUIView!
    
    @IBOutlet var logoStackView: UIStackView!
    @IBOutlet var emailAddressStackView: UIStackView!
    @IBOutlet var passwordInputStackView: UIStackView!
    @IBOutlet var emailInputView: CustomTextField!
    @IBOutlet var passwordInputView: CustomTextField!
    @IBOutlet var loginButton: RoundedSquareButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    private var intialScrollOffset: CGFloat = 100
    private var emailAddress = ""
    private var password = ""

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateStackViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !(scrollView.contentOffset.y == -100) {
            scrollView.contentOffset.y = -250
        }
    }
    
    // MARK: - IBOutlet
    
    @IBAction private func scrollUp() {
        UIView.animate(withDuration: 0.2) {
            self.scrollView.contentOffset.y = -100
        }
    }
    
    @IBAction private func scrollDown() {
        UIView.animate(withDuration: 0.2) {
            self.scrollView.contentOffset.y = -250
        }
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        displayAlertView()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: RoundedSquareButton) {
        // Goto --> 4 main buttons screen
    }
    
    @IBAction private func touchedDown(with sender: RoundedSquareButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @IBAction private func touchedUp(with sender: RoundedSquareButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    @IBAction private func nextScreen(with sender: RoundedSquareButton) {
        UIView.animate(withDuration: 0.2,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (finished) in
            if finished {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    // Segue to main menu screen
                    //Search for now for devving.
                    self.performSegue(withIdentifier: "SearchBicycleSegue", sender: nil)
                }
            }
        }
    }
    
    // MARK: - Private
    
    private func configureUI() {
        configureButtons()
    }
    
    private func configureButtons() {
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19.0),
                          NSAttributedString.Key.foregroundColor : UIColor.lightText,
                          NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        let signUpString = NSAttributedString(string: "Sign up", attributes: attributes)
        signUpButton.setAttributedTitle(signUpString, for: .normal)
        let forgotPasswordString = NSAttributedString(string: "Forgot Password?", attributes: attributes)
        forgotPasswordButton.setAttributedTitle(forgotPasswordString, for: .normal)
    }

    private func animateStackViews() {
        let duration = 0.3
        let scaleBig: CGFloat = 1.1
        let originalScale: CGFloat = 1
        let delay = 0.0
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseInOut,
                       animations: {
                        self.logoStackView.transform = CGAffineTransform(scaleX: scaleBig, y: scaleBig)
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: duration,
                               delay: 0,
                               options: .curveEaseInOut,
                               animations: {
                                self.logoStackView.transform = CGAffineTransform(scaleX: originalScale, y: originalScale)
                                self.emailAddressStackView.transform = CGAffineTransform(scaleX: scaleBig, y: scaleBig)

                }) { (finished) in
                    if finished {
                        UIView.animate(withDuration: duration,
                                       delay: 0,
                                       options: .curveEaseInOut,
                                       animations: {
                                        self.emailAddressStackView.transform = CGAffineTransform(scaleX: originalScale, y: originalScale)
                                        self.passwordInputStackView.transform = CGAffineTransform(scaleX: scaleBig, y: scaleBig)
                        }) { (finished) in
                            if finished {
                                UIView.animate(withDuration: duration,
                                               delay: 0,
                                               options: .curveEaseInOut,
                                               animations: {
                                                self.passwordInputStackView.transform = CGAffineTransform(scaleX: originalScale, y: originalScale)
                                                self.loginButton.backgroundColor = UIColor.systemGray3
                                                self.loginButton.titleLabel?.textColor = UIColor.black
                                }) { (finished) in
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}

extension EnterEmailAndPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailInputView:
            if let passwordInputView = passwordInputView {
                passwordInputView.becomeFirstResponder()
            }
            emailAddress = textField.text ?? ""
        case passwordInputView:
            password = textField.text ?? ""
            passwordInputView.resignFirstResponder()
            UIView.animate(withDuration: 0.3,
                           delay: 0.5,
                           options: .curveEaseInOut,
                           animations: {
                            self.loginButton.backgroundColor = UIColor.systemIndigo
                            self.loginButton.titleLabel?.textColor = UIColor.white
            })
        default:
            break
        }
        return true
    }
}

extension EnterEmailAndPasswordViewController: UIScrollViewDelegate {
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
