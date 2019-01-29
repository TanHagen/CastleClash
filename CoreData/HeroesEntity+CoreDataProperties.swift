//
//  HeroesEntity+CoreDataProperties.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 24.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//
//

import Foundation
import CoreData


extension HeroesEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeroesEntity> {
        return NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
    }
    
    @NSManaged public var alpha: Double
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    
}
