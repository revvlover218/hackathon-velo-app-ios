//
//  BaseViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/02.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class BaseViewController: LoadingIndicatorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayAlertView() {
        let alertView = UIAlertController(title: "Velo",
                                          message: "This feature will be availabe soon! Thank you.",
                                          preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Dismiss", style: .default)
        alertView.addAction(alertAction)
        self.present(alertView, animated: true, completion: nil)
    }
}
