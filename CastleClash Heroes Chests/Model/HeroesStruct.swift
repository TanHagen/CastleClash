//
//  HeroesStruct.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 14.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import Foundation

struct HeroesBase {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

struct Heroes {
    var name: String
    var image: String
    var alpha: Double
    
    init(name: String, image: String, alpha: Double) {
        self.name = name
        self.image = image
        self.alpha = alpha
    }
}
