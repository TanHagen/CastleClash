//
//  AltarHeroesViewController.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 14.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

final class AltarHeroesViewController: UIViewController {
    
    var backgroundImageView = UIImageView()
    var backgroundImage = UIImage(named: "background_altar.png")
    var archImageView = UIImageView()
    var archImage = UIImage(named: "arch_default.png")
    var gemsImageView = UIImageView()
    var gemsImage = UIImage(named: "gem.png")
    
    var heroOnArchImageView = UIImageView()
    
    var backButton = UIButton()
    var backButtonImage = UIImage(named: "back_button.png")
    var summonButton = UIButton()
    var summonButtonImage = UIImage(named: "summon_button.png")
    
    var heroNameLabel = UILabel()
    var gemsLabel = UILabel()
    var gemsInt = Int()

    var transferSummonHeroesArray = [Heroes]()
    
    let summonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "summon_sound", ofType: "mp3")!)
    let altarCloseSound = URL(fileURLWithPath: Bundle.main.path(forResource: "close_sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    private let coreDataSource = CoreDataSource()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createImages()
        createLabels()
        createButtons()
    }
    
    @objc private func summonHero() {
        
        if gemsInt > 0 {
            gemsInt = gemsInt - 150
            gemsLabel.text = "\(gemsInt)"
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: summonSound)
                audioPlayer.play()
            } catch {
                print("couldn't load summon sound")
            }
            summonButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            
            let classRandom = Int.random(in: 1...1000)
            switch classRandom {
            case 1...700: // 70%
                let random = Int.random(in: App.shared.greenHeroesArray.indices)
                let name = App.shared.greenHeroesArray[random].name
                let backgroundImage = SummonHeroImage.green.rawValue
                let image = App.shared.greenHeroesArray[random].image
                archImageView.image = UIImage(named: backgroundImage)
                heroOnArchImageView.image = UIImage(named: image)
                heroNameLabel.text = name
                
                if let _ = transferSummonHeroesArray.firstIndex(where: { $0.name == heroNameLabel.text }) {
                    printAlreadyExist()
                } else {
                    transferSummonHeroesArray.append(Heroes(name: name, image: image, alpha: 1.0))
                    printNewHeroAdded()
                    coreDataSource.saveArray(transferSummonHeroesArray)
                }
                
            case 701...950: // 25%
                let random = Int.random(in: App.shared.blueHeroesArray.indices)
                let name = App.shared.blueHeroesArray[random].name
                let backgroundImage = SummonHeroImage.blue.rawValue
                let image = App.shared.blueHeroesArray[random].image
                archImageView.image = UIImage(named: backgroundImage)
                heroOnArchImageView.image = UIImage(named: image)
                heroNameLabel.text = name
                
                if let _ = transferSummonHeroesArray.firstIndex(where: { $0.name == heroNameLabel.text }) {
                    printAlreadyExist()
                } else {
                    transferSummonHeroesArray.append(Heroes(name: name, image: image, alpha: 1.0))
                    printNewHeroAdded()
                    coreDataSource.saveArray(transferSummonHeroesArray)
                }
                
            case 951...995: // 4.5%
                let random = Int.random(in: App.shared.legendaryHeroesArray.indices)
                let name = App.shared.legendaryHeroesArray[random].name
                let backgroundImage = SummonHeroImage.legendary.rawValue
                let image = App.shared.legendaryHeroesArray[random].image
                archImageView.image = UIImage(named: backgroundImage)
                heroOnArchImageView.image = UIImage(named: image)
                heroNameLabel.text = name
                
                if let _ = transferSummonHeroesArray.firstIndex(where: { $0.name == heroNameLabel.text }) {
                    printAlreadyExist()
                } else {
                    transferSummonHeroesArray.append(Heroes(name: name, image: image, alpha: 1.0))
                    printNewHeroAdded()
                    coreDataSource.saveArray(transferSummonHeroesArray)
                }
                
            case 996...1000: // 0.5%
                let random = Int.random(in: App.shared.donateHeroesArray.indices)
                let name = App.shared.donateHeroesArray[random].name
                let backgroundImage = SummonHeroImage.donate.rawValue
                let image = App.shared.donateHeroesArray[random].image
                archImageView.image = UIImage(named: backgroundImage)
                heroOnArchImageView.image = UIImage(named: image)
                heroNameLabel.text = name
                
                if let _ = transferSummonHeroesArray.firstIndex(where: { $0.name == heroNameLabel.text }) {
                    printAlreadyExist()
                } else {
                    transferSummonHeroesArray.append(Heroes(name: name, image: image, alpha: 1.0))
                    printNewHeroAdded()
                    coreDataSource.saveArray(transferSummonHeroesArray)
                }
            default:
                break
            }
            summonButton.isEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.summonButton.isEnabled = true
            }
            coreDataSource.saveGems(gemsInt: gemsInt)
        } else if gemsInt == 0 {
            print("Нехватает самоцветов для вызова героя.")
        }
        
    }
    
    private func createButtons() {
        
        self.view.addSubview(backButton)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.setImage(backButtonImage, for: .highlighted)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        backButton.addTarget(self, action: #selector(resizeBackButton), for: .touchDown)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(cancelResizeBackButton), for: .touchDragExit)
        
        self.view.addSubview(summonButton)
        summonButton.setImage(summonButtonImage, for: .normal)
        summonButton.setImage(summonButtonImage, for: .highlighted)
        summonButton.translatesAutoresizingMaskIntoConstraints = false
        summonButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        summonButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        summonButton.topAnchor.constraint(equalTo: archImageView.bottomAnchor, constant: 7).isActive = true
        summonButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        summonButton.contentMode = .scaleAspectFit
        summonButton.addTarget(self, action: #selector(resizeSummonButton), for: .touchDown)
        summonButton.addTarget(self, action: #selector(summonHero), for: .touchUpInside)
        summonButton.addTarget(self, action: #selector(cancelResizeSummonButton), for: .touchDragExit)
    }
    
    @objc private func resizeSummonButton() {
        summonButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
    }
    @objc private func cancelResizeSummonButton() {
        summonButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    @objc private func goBack() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: altarCloseSound)
            audioPlayer.play()
        } catch {
            print("couldn't load altar close sound")
        }
        self.dismiss(animated: true, completion: nil)
        backButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    @objc private func resizeBackButton() {
        backButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
    }
    @objc private func cancelResizeBackButton() {
        backButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    // Добавил задний фон и логотип
    private func createImages() {
        
        self.view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = backgroundImage
        
        self.view.addSubview(archImageView)
        archImageView.translatesAutoresizingMaskIntoConstraints = false
        archImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        archImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        archImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4).isActive = true
        archImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
        archImageView.contentMode = .scaleAspectFill
        archImageView.image = archImage
        
        self.view.addSubview(heroOnArchImageView)
        heroOnArchImageView.translatesAutoresizingMaskIntoConstraints = false
        heroOnArchImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroOnArchImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        heroOnArchImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4).isActive = true
        heroOnArchImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
        heroOnArchImageView.contentMode = .scaleAspectFill
        
        self.view.addSubview(gemsImageView)
        gemsImageView.translatesAutoresizingMaskIntoConstraints = false
        gemsImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/7).isActive = true
        gemsImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        gemsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        gemsImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        gemsImageView.contentMode = .scaleToFill
        gemsImageView.image = gemsImage
    }
    
    private func createLabels() {
        self.view.addSubview(heroNameLabel)
        heroNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heroNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        heroNameLabel.bottomAnchor.constraint(equalTo: archImageView.bottomAnchor, constant: 0).isActive = true
        heroNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroNameLabel.textAlignment = .center
        heroNameLabel.shadowOffset = .init(width: 2.0, height: 2.0)
        heroNameLabel.shadowColor = .black
        heroNameLabel.textColor = .white
        heroNameLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        
        self.view.addSubview(gemsLabel)
        gemsLabel.translatesAutoresizingMaskIntoConstraints = false
        gemsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        gemsLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        gemsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        gemsLabel.rightAnchor.constraint(equalTo: gemsImageView.leftAnchor, constant: -10).isActive = true
        gemsLabel.textAlignment = .right
        gemsLabel.shadowOffset = .init(width: 2.0, height: 2.0)
        gemsLabel.shadowColor = .black
        gemsLabel.textColor = .white
        gemsLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        gemsLabel.text = "\(gemsInt)"
    }
    
    func printNewHeroAdded() {
        print("""
            
            Поздравляем! Вы получили нового героя - \(heroNameLabel.text!) (\(transferSummonHeroesArray.count) из \(App.shared.allHeroesArray.count)) героев.
            """)
    }
    
    func printAlreadyExist() {
        print("""
            
            \(heroNameLabel.text!) уже в коллекции!
            В вашей коллекции по-прежнему - \(transferSummonHeroesArray.count) из \(App.shared.allHeroesArray.count) героев.
            """)
    }
    
    deinit {
        let file = (#file as NSString).lastPathComponent
        print("""
            
            \(file) deinit
            """)
    }
}
