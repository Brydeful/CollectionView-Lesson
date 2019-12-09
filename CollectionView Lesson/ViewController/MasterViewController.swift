//
//  MasterViewController.swift
//  CollectionView Lesson
//
//  Created by Вячеслав on 08.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class MasterViewController: UICollectionViewController {
    
    fileprivate var parksDataSource = ParksDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewCell()
        collectionView.register(ParkCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Setup

    private func setupCollectionViewCell(){
        let width = collectionView.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionHeadersPinToVisibleBounds = true
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail"{
            if let destanationViewController = segue.destination as? DetailViewController{
                destanationViewController.park = sender as? Park
            }
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return parksDataSource.numberOfSections
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return parksDataSource.numberOfParksInSection(section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ParkCollectionViewCell
        if let nationalPark = parksDataSource.parkForItemAtIndexPath(indexPath){
            cell.park = nationalPark
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
        if let title = parksDataSource.titleForSectionAtIndexPath(indexPath){
            sectionHeaderView.title = title
        }
        
        return sectionHeaderView
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let nationalPark = parksDataSource.parkForItemAtIndexPath(indexPath){
            performSegue(withIdentifier: "MasterToDetail", sender: nationalPark)
        }
    }
}
