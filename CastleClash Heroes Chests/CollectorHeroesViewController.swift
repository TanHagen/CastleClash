//
//  CollectorHeroesViewController.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 14.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit
import AVFoundation

final class CollectorHeroesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    init(heroes: [Heroes]?) {
        super.init(nibName: nil, bundle: nil)
        if let heroes = heroes {
            self.summonHeroesArray = heroes
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let coreDataSource = CoreDataSource()
    var backgroundImageView = UIImageView()
    
    var backButton = UIButton()
    var BackButtonImage = UIImage(named: "back_button.png")
    
    var headerView = UIView()
    var summonHeroesArray = [Heroes]()
    
    var collectionView: UICollectionView!
    
    let collectionCloseSound = URL(fileURLWithPath: Bundle.main.path(forResource: "close_sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        createImages()
        createCollection()
        createButtons()
        createView()

    }

    override func viewWillAppear(_ animated: Bool) {
        
        for i in summonHeroesArray {
            if let index = App.shared.allHeroesArray.firstIndex(where: { $0.name == i.name }) {
                App.shared.allHeroesArray[index].alpha = 1.0
            }
        }
        collectionView.reloadData()
    }

    func createCollection() {

        // Создали и назначили параметры у UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let width: CGFloat = (UIScreen.main.bounds.width - 40)/3
        let height: CGFloat = 145
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical

        collectionView = {
            let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
            view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
            view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            view.delegate = self
            view.dataSource = self
            view.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
            view.alwaysBounceVertical = true
            return view
        }()
    }

    // Добавил задний фон и логотип
    func createImages() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
    }
    
    func createView() {
//        self.view.addSubview(headerView) // вот моя черная полоска
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//        headerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 1/6 + 12).isActive = true
//        headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        headerView.backgroundColor = .black
//        headerView.alpha = 0.5
    }

    func createButtons() {
        self.view.addSubview(backButton)// если эту убираю сразу ошибки
        backButton.setImage(BackButtonImage, for: .normal)
        backButton.setImage(BackButtonImage, for: .highlighted)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        backButton.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        backButton.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor, constant: 12).isActive = true
        backButton.addTarget(self, action: #selector(resizeBackButton), for: .touchDown)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(cancelResizeBackButton), for: .touchDragExit)
        //self.view.bringSubviewToFront(backButton)
        self.backButton.superview!.bringSubviewToFront(self.backButton)
    }

    @objc func goBack() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: collectionCloseSound)
            audioPlayer.play()
        } catch {
            print("couldn't load collection close sound")
        }
        self.dismiss(animated: true, completion: nil)
        backButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }

    @objc func resizeBackButton() {
        backButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
    }
    @objc func cancelResizeBackButton() {
        backButton.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return App.shared.allHeroesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let heroesIndex = App.shared.allHeroesArray[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.heroImage.image = UIImage(named: heroesIndex.image)
        cell.heroImage.contentMode = .scaleAspectFit
        cell.nameLabel.text = heroesIndex.name
        cell.heroImage.alpha = CGFloat(heroesIndex.alpha)
        cell.nameLabel.alpha = CGFloat(heroesIndex.alpha)

        return cell
    }

    deinit {
        let file = (#file as NSString).lastPathComponent
        print("""
            
            \(file) deinit
            """)
    }
}
