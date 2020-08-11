//
//  EnterEmailAndPasswordViewController.swift
//  velo
//
//  Created by ReshalAdmin on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class EnterEmailAndPasswordViewController: BaseViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var logoView: CustomUIView!
    
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    private var intialScrollOffset: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configureUI()
    }
    
    
    // MARK: - Private
    
    private func configureUI() {
        scrollView.contentOffset.y = 200
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
        self.view.resignFirstResponder()
        return true
    }
}

extension EnterEmailAndPasswordViewController: UIScrollViewDelegate {
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
