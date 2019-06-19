//
//  AppsViewCell.swift
//  uikit-n-combine
//
//  Created by Vinicius Mangueira Correia on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AppsViewCell: UICollectionViewCell {
    
    var result: Result! {
        didSet {
            nameGroup.text = result.trackName
            descriptionGroup.text = result.primaryGenreName
        }
    }
    
    lazy var imageGroup = UIImageView(imageName: "group")
    lazy var blurView = UIView(with: 0.6)
    lazy var nameGroup = UILabel(text: "Globo Play", textSize: 16, textColor: .white)
    lazy var descriptionGroup = UILabel(text: "Entertainment", textSize: 16, textColor: .white)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 16
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.borderWidth = 3
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(imageGroup)
        self.addSubview(blurView)
        self.addSubview(nameGroup)
        self.addSubview(descriptionGroup)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageGroup.topAnchor.constraint(equalTo: self.topAnchor),
            imageGroup.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageGroup.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageGroup.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            blurView.heightAnchor.constraint(equalToConstant: 80),
            nameGroup.topAnchor.constraint(equalTo: self.blurView.topAnchor, constant: 10),
            nameGroup.leadingAnchor.constraint(equalTo: self.blurView.leadingAnchor, constant: 10),
            descriptionGroup.topAnchor.constraint(equalTo: self.nameGroup.bottomAnchor, constant: 10),
            descriptionGroup.leadingAnchor.constraint(equalTo: self.blurView.leadingAnchor, constant: 10),
            ])
    }
}



