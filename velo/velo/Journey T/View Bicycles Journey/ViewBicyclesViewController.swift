//
//  ViewBicyclesViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/02.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class ViewBicyclesViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoadingIndicator()
    }
    
    @IBAction private func someButtonTapped(_ sender: UIButton) {
        print("Button Pressed")
        stopLoadingIndicator()
    }
}
