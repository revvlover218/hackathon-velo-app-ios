//
//  BicycleCollectionViewCell.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/05.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

class BicycleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var title: UILabel!
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var shadowView: UIView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                UIView.animate(withDuration: 0.2) {
                    self.shadowView.backgroundColor = .systemIndigo
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.shadowView.backgroundColor = UIColor.systemGray4
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
    
    func setBicyle(with item: BicycleItem) {
        title.text = item.name
        image.image = item.image
        configureCell()
    }
    
    private func configureCell() {
        shadowView.layer.cornerRadius = 10
        shadowView.layer.masksToBounds = true
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
        shadowView.layer.shadowRadius = 25
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 25).cgPath
        
    }
}
