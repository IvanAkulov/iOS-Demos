//
//  Restarurant.swift
//  UISearchController
//
//  Created by Alexey Efimov on 17/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import RealmSwift

class Restaurant: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var type: RestaurantType?
}

class RestaurantType: Object {
    @objc dynamic var name = ""
}
