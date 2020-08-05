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
        configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9684304662, green: 0.9778327037, blue: 0.9590282287, alpha: 1)
    }
}
