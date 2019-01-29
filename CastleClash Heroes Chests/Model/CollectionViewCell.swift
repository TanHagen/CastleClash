//
//  CollectionViewCell.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 14.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    private var container: UIView!
    var nameLabel: UILabel!
    var heroImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        
        container = {
            let view = UIView()
            self.contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
            view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
            view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
            view.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
            view.clipsToBounds = true
            return view
        }()
        
        heroImage = {
            let heroImage = UIImageView()
            container.addSubview(heroImage)
            heroImage.translatesAutoresizingMaskIntoConstraints = false
            heroImage.contentMode = .scaleAspectFill
            heroImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
            heroImage.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0).isActive = true
            heroImage.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1).isActive = true
            heroImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
            heroImage.contentMode = .scaleAspectFit
            heroImage.clipsToBounds = true
            heroImage.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
            return heroImage
        }()
        
        nameLabel = {
            let nameLabel = UILabel()
            container.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 0).isActive = true
            nameLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0).isActive = true
            nameLabel.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1).isActive = true
            nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
            nameLabel.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
            nameLabel.textColor = UIColor.black
            nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            nameLabel.adjustsFontSizeToFitWidth = true
            nameLabel.minimumScaleFactor = 0.7
            nameLabel.textAlignment = .center
            nameLabel.numberOfLines = 0
            return nameLabel
        }()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
