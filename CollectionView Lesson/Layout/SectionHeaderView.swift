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
    
    var title: String? {
        didSet{
            titleLabel.text = title
        }
    }
}
