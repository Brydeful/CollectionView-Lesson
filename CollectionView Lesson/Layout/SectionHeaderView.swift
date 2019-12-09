//
//  SectionHeaderView.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 08.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    var title: String? {
        didSet{
            titleLabel.text = title
            if let image = UIImage(named: title!){
                flagImage.image = image
            }
        }
    }
}
