//
//  Restarurant.swift
//  UISearchController
//
//  Created by Alexey Efimov on 17/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import Foundation

struct Restaurant {
    
    var name: String
    var type: RestaurantType
}

enum RestaurantType: String {
    case restaurant = "Restaurant"
    case fastfood = "Fastfood"
    case bar = "Bar"
}
