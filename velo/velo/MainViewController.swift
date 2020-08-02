//
//  MainViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/02.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction private func demoButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ViewBicyclesSegue", sender: sender)
    }
}

