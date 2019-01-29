//
//  CoreDataSource.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 25.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import CoreData
import UIKit

class CoreDataSource {
    
    // MARK: - Properties
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // Для самоцветов
    func saveGems(gemsInt: Int) {
        let entity = NSEntityDescription.entity(forEntityName: "Gems", in: context)
        let gems = NSManagedObject(entity: entity!, insertInto: context) as! Gems
        gems.gems = Int64(gemsInt)
        do {
            try context.save()
            print("\(gems.gems) самоцветов СОХРАНЕНО в CoreData!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchGems() -> Int {
        let request: NSFetchRequest<Gems> = Gems.fetchRequest()
        var gems = 9000
        do {
            let result = try context.fetch(request)
            if result.count > 0 {
                gems = Int((result.last?.gems)!)
            print(result.count)
                print("\(gems) самоцветов ЗАГРУЖЕНО из CoreData!")
            }
        } catch {
            print(error.localizedDescription)
        }
        return Int(gems)
    }
    
    // MARK: - Public methods
    func saveArray(_ heroes: [Heroes]) {
        mapToHeroesEntity(from: heroes)
        do {
            try context.save()
            print("СОХРАНЕНО")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchArray() -> [Heroes] {
        let request: NSFetchRequest<HeroesEntity> = HeroesEntity.fetchRequest()
        var heroes = [Heroes]()
        do {
            let result = try context.fetch(request)
            heroes = mapToHeroes(from: result)
            print("ЗАГРУЖЕНО")
        } catch {
            print(error.localizedDescription)
        }
        return heroes
    }
    
    // MARK: - Private methods
    /// Метод маппинга из структуры Heroes в HeroesEntity, для того, чтобы мы могли сохранить в кордату в нужном формате.
    /// - parameter heroes: сюда передаем массив героев, которых надо сохранить
    
    private func mapToHeroesEntity(from heroes: [Heroes]) {
        let heroesEntity = HeroesEntity(context: context)
        for hero in heroes {
            heroesEntity.name = hero.name
            heroesEntity.image = hero.image
            heroesEntity.alpha = hero.alpha
        }
    }
    
    /// Тоже самое, что и выше, только наоборот
    private func mapToHeroes(from entity: [HeroesEntity]) -> [Heroes] {
        var heroes = [Heroes]()
        for element in entity {
            let hero = Heroes(name: element.name ?? "", image: element.image ?? "", alpha: element.alpha)
            heroes.append(hero)
        }
        return heroes
    }
}
