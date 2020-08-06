//
//  MainBicyclesList.swift
//  velo
//
//  Created by Reshal Luchman on 2020/08/05.
//  Copyright © 2020 ReshalLuchman. All rights reserved.
//

import UIKit

enum BicycleType: String {
    case roadBike = "roadBike"
    case mountainBike = "mountainBike"
    case timeTrialBike = "timeTrialBike"
    case eBike = "eBike"
}

struct BicycleItem {
    var name: String?
    var image: UIImage?
    var type: BicycleType?
}

struct MainBicyclesList {
    var bicylesList = [
        BicycleItem(name: "2016 Silverback Sirelli 2 Carbon Road Bike",
                    image: UIImage(named: "Bike1"),
                    type: .roadBike),
        BicycleItem(name: "2020 Silverback Sola 2 Hardtail Aluminium Mountain Bike",
                    image: UIImage(named: "Bike2"),
                    type: .mountainBike),
        BicycleItem(name: "2020 Liv Pique 3 Lady’s Mountain Bike",
                    image: UIImage(named: "Bike3"),
                    type: .mountainBike),
        BicycleItem(name: "2020 Liv Embolden E+2 E-Mountain Bike",
                    image: UIImage(named: "Bike4"),
                    type: .eBike)
    ]
}
