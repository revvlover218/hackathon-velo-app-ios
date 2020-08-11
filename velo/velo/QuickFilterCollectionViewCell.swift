//
//  QuickFilterCollectionViewCell.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class QuickFilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var colorBackgroundView: CustomUIView!
    @IBOutlet private var gradientView: CustomUIView!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var titleLabel: CustomLabel!
    
    private var quickFilter: QuickFilterModel?
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                UIView.animate(withDuration: 0.2) {
                    self.colorBackgroundView.backgroundColor = .systemIndigo
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.colorBackgroundView.backgroundColor = self.quickFilter?.color ?? UIColor.systemGray4
                }
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2) {
                    self.contentView.backgroundColor = UIColor.systemIndigo
                    self.contentView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.contentView.backgroundColor = nil
                    self.contentView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }

    func setup(with quickFilter: QuickFilterModel) {
        self.quickFilter = quickFilter
        titleLabel.text = quickFilter.title
        iconImageView.image = quickFilter.image
        
        setBackgroundColor(with: quickFilter.color)
        addGradient()
    }
    
    private func setBackgroundColor(with color: UIColor) {
        self.colorBackgroundView.backgroundColor = color
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientView.bounds
        let topColor = UIColor.clear.cgColor
        let bottomColor = UIColor.black.cgColor
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.gradientView.layer.insertSublayer(gradientLayer, at: 0)
        self.gradientView.layer.cornerRadius = 10
        self.gradientView.layer.masksToBounds = true
        self.gradientView.alpha = 0.6
    }
}
