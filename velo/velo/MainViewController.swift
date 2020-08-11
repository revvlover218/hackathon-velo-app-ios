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
        startLoadingIndicator()
        stopDummyLoading()
    }
    
    private func stopDummyLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.stopLoadingIndicator()
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }
    }
}
