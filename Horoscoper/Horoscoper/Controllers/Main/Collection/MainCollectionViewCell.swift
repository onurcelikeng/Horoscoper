//
//  MainCollectionViewCell.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var groundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func displayContent(model: HoroscopeModel) {
        nameLabel.text = model.name
        imageView.image = UIImage(named: model.image)
        groundView.backgroundColor = model.color
    }
}
