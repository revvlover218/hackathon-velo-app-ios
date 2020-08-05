//
//  BaseNavigationViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/02.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    private func configureNavigation() {
        let navigationController = self.navigationController?.navigationBar
        navigationController?.barTintColor = #colorLiteral(red: 0.9684304662, green: 0.9778327037, blue: 0.9590282287, alpha: 1)
        navigationController?.shadowImage = UIImage()
    }
}
