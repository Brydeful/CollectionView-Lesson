//
//  Park.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 08.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import Foundation

class Park {
    
    var name: String
    var country: String
    var date: String
    var photo: String
    var index: Int
    
    init(name: String, country: String, date: String, photo: String, index: Int) {
        self.name = name
        self.country = country
        self.date = date
        self.photo = photo
        self.index = index
    }
    
    convenience init(copying park: Park) {
        self.init(name: park.name, country: park.country, date: park.date, photo: park.photo, index: park.index)
    }
    
}
