//
//  GradientView.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 08.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

class GradientView: UIView {

    lazy fileprivate var gradienLayer: CAGradientLayer = {
        let startColor = UIColor.clear.cgColor
        let endColor = UIColor(white: 0.0, alpha: 0.75).cgColor
        let gradienLayer = CAGradientLayer()
        gradienLayer.colors = [startColor, endColor]
        gradienLayer.startPoint = CGPoint(x: 0, y: 0)
        gradienLayer.endPoint = CGPoint(x: 0, y: 1)
        
        return gradienLayer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        layer.addSublayer(gradienLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradienLayer.frame = bounds
    }
}
