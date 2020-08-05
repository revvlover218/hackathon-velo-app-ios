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
    
    func setBicyle(with item: BicycleItem) {
        title.text = item.name
        image.image = item.image
        configureCell()
    }
    
    private func configureCell() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        contentView.layer.masksToBounds = true
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.layer.bounds,
                                                    byRoundingCorners: .allCorners,
                                                    cornerRadii: CGSize(width: 8, height: 8)).cgPath
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }
}
