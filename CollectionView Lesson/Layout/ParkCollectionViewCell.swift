//
//  ParkCollectionViewCell.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 08.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

class ParkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parkImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var park: Park?{
        didSet{
            if let nationalPark = park{
                parkImageView.image = UIImage(named: nationalPark.photo)
                captionLabel.text = nationalPark.photo
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        parkImageView.image = nil
        
    }
}
