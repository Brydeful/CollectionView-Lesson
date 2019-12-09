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
    @IBOutlet weak var chekedImageView: UIImageView!
    var park: Park? {
        
        didSet {
            if let nationalPark = park {
                parkImageView.image = UIImage(named: nationalPark.photo)
                captionLabel.text = nationalPark.photo
            }
        }
    }
    
    var editing = false{
        didSet{
            captionLabel.isHidden = editing
            chekedImageView.isHidden = !editing
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if editing{
                chekedImageView.image = UIImage(systemName: isSelected ? "checkmark.circle": "circle")
            }

        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if editing{
            chekedImageView.image = UIImage(systemName: isSelected ? "checkmark.circle": "circle")
        }
        parkImageView.image = nil
        
    }
}
