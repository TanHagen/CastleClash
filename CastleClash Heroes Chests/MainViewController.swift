//
//  ViewController.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 13.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit
import AVFoundation

final class MainViewController: UIViewController {

    let altarHeroesViewControler = AltarHeroesViewController()
    
    // Картинка заднего фона
    var backgroundImageView = UIImageView()
    var backgroundImage = UIImage(named: "background_main.png")
    
    // Картинка логотипа
    var logoImageView = UIImageView()
    var logoImage = UIImage(named: "cc_logo.png")
    
    // Кнопка перехода в алтарь для вызова героев
    var heroesAltarButton = UIButton()
    var heroesAltarImageView = UIImageView()
    var heroesAltarImage = UIImage(named: "heroes_altar.png")
    
    // Кнопка перехода на ячейки коллекций
    var collectionButton = UIButton()
    var collectionButtonImageView = UIImageView()
    var collectionButtonImage = UIImage(named: "warehouse.png")
    
    // Звуковые эффекты
    let altarOpenSound = URL(fileURLWithPath: Bundle.main.path(forResource: "altar_open_sound", ofType: "mp3")!)
    let collectionOpenSound = URL(fileURLWithPath: Bundle.main.path(forResource: "my_collection_open_sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    private let coreDataSource = CoreDataSource()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.black
        createImages()
        createButtons()
        altarHeroesViewControler.transferSummonHeroesArray = coreDataSource.fetchArray()
        altarHeroesViewControler.gemsInt = coreDataSource.fetchGems()
    
    }
    
    // Добавил алтарь героев для перехода на другой VK.
    private func createButtons() {
        heroesAltarImageView = UIImageView(image: heroesAltarImage)
        heroesAltarButton.setBackgroundImage(heroesAltarImage, for: .normal)
        heroesAltarButton.setBackgroundImage(heroesAltarImage, for: .highlighted)
        heroesAltarButton.frame = CGRect(x: 30,
                                         y: Int(UIScreen.main.bounds.height/9 + logoImageView.bounds.height),
                                         width: Int(UIScreen.main.bounds.width/2.5),
                                         height: Int(UIScreen.main.bounds.width/2.5))
        view.addSubview(heroesAltarButton)
        heroesAltarButton.addTarget(self, action: #selector(resizeAltar), for: .touchDown)
        heroesAltarButton.addTarget(self, action: #selector(goToAltar), for: .touchUpInside)
        heroesAltarButton.addTarget(self, action: #selector(cancelResizeAltar), for: .touchDragExit)
        
        collectionButtonImageView = UIImageView(image: collectionButtonImage)
        collectionButton.setBackgroundImage(collectionButtonImage, for: .normal)
        collectionButton.setBackgroundImage(collectionButtonImage, for: .highlighted)
        collectionButton.frame = CGRect(x:  Int(UIScreen.main.bounds.width - UIScreen.main.bounds.width/2.5 - 30),
                                        y: Int(UIScreen.main.bounds.height/9 + logoImageView.bounds.height),
                                        width: Int(UIScreen.main.bounds.width/2.5),
                                        height: Int(UIScreen.main.bounds.width/2.5))
        view.addSubview(collectionButton)
        collectionButton.addTarget(self, action: #selector(resizeCollection), for: .touchDown)
        collectionButton.addTarget(self, action: #selector(goToCollection), for: .touchUpInside)
        collectionButton.addTarget(self, action: #selector(cancelResizeCollection), for: .touchDragExit)
    }
    
    @objc func goToAltar() {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: altarOpenSound)
            audioPlayer.play()
        } catch {
            print("couldn't load altar open sound")
        }
        self.present(altarHeroesViewControler, animated: true, completion: nil)
        heroesAltarButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    @objc private func resizeAltar() {
        heroesAltarButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
    }
    @objc private func cancelResizeAltar() {
        heroesAltarButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    @objc private func goToCollection() {
        let collectionHeroesViewControler = CollectorHeroesViewController(heroes: self.altarHeroesViewControler.transferSummonHeroesArray)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: collectionOpenSound)
            audioPlayer.play()
        } catch {
            print("couldn't load collection open sound")
        }
        self.present(collectionHeroesViewControler, animated: true, completion: nil)
        collectionButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    @objc private func resizeCollection() {
        collectionButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
    }
    @objc private func cancelResizeCollection() {
        collectionButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }
    
    // Добавил задний фон и логотип
    private func createImages() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = backgroundImage
        backgroundImageView.alpha = 0.9
        
        logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: (UIScreen.main.bounds.width - logoImageView.bounds.width)/2,
                                     y: UIScreen.main.bounds.height/18,
                                     width: logoImageView.bounds.width,
                                     height: logoImageView.bounds.height)
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
    }
    
    deinit {
        let file = (#file as NSString).lastPathComponent
        print("\(file) deinit")
    }
}
