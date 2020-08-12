//
//  QuickFilterModel.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/11.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

struct QuickFilterModel {
    var title = ""
    var image = UIImage()
    var color = UIColor()
    var type: BicycleType = .roadBike
}

struct QuickFilterList {
    static var list = [
        QuickFilterModel(title: "Road Bike",
                         image: UIImage(named: "SearchScreenRoadBike")!,
                         color: .systemGray4,
                         type: .roadBike),
        QuickFilterModel(title: "Mountain Bike",
                         image: UIImage(named: "SearchScreenMountainBike")!,
                         color: .systemGray4,
                         type:  .mountainBike),
        QuickFilterModel(title: "Time Trial Bike",
                         image: UIImage(named: "SearchScreenTimeTrial")!,
                         color: .systemGray4,
                         type: .timeTrialBike),
        QuickFilterModel(title: "e-Bike",
                         image: UIImage(named: "SearchScreenElectricBike")!,
                         color: .systemGray4,
                         type: .eBike)
    ]
}
