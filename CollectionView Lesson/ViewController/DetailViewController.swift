//
//  DetailViewController.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 08.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var park: Park?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let nationalPark = park{
            navigationItem.title = nationalPark.name
            imageView.image = UIImage(named: nationalPark.photo)
            nameLabel.text = nationalPark.name
            countryLabel.text = nationalPark.country
            dateLabel.text = nationalPark.date
        }
    }
}
