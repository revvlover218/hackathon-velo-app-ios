//
//  LoadingIndicatorViewController.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/02.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class LoadingIndicatorViewController: BaseNavigationViewController {
    
    private lazy var loadingIndicatorView = LoadingIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startLoadingIndicator() {
        self.view.addSubview(loadingIndicatorView)
    }
    
    func stopLoadingIndicator() {
        loadingIndicatorView.stopAnimating()
    }
}

// Dummy timer example to simulate data loaded in seconds
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.stopLoadingIndicator()
//        }
