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
    @IBOutlet var emailInputView: CustomTextField!
    @IBOutlet var passwordInputView: CustomTextField!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    private var intialScrollOffset: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configureUI()
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
        let alertView = UIAlertController(title: "Velo",
                                          message: "This feature will be availabe soon! Thank you.",
                                          preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Dismiss", style: .default)
        alertView.addAction(alertAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: RoundedSquareButton) {
        // Goto --> 4 main buttons screen
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
}

extension EnterEmailAndPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailInputView:
            if let passwordInputView = passwordInputView {
                passwordInputView.becomeFirstResponder()
            }
        case passwordInputView:
            passwordInputView.resignFirstResponder()
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
