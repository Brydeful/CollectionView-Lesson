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
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    fileprivate var parksDataSource = ParksDataSource()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewCell()
        setupRefreshControl()
        setupNavigationBar()
    }
    
    // MARK: - Setup
    
    fileprivate func setupRefreshControl(){
        refreshControl.addTarget(self, action: #selector(refreshDidFire), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    fileprivate func setupNavigationBar(){
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    fileprivate func setupCollectionViewCell(){
        collectionView.register(ParkCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
        let width = collectionView.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionHeadersPinToVisibleBounds = true
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    @objc func refreshDidFire(){
        if !isEditing{
            addButtonTapped(nil)
        }
        refreshControl.endRefreshing()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail"{
            if let destanationViewController = segue.destination as? DetailViewController{
                destanationViewController.park = sender as? Park
            }
        }
    }
    
    //MARK: - Button
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem?) {
        let indexPath = parksDataSource.indexPathForNewRandomPark()
        
        let layout = collectionViewLayout as! ParksViewFlowLayout
        layout.appearingIndexPath = indexPath
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0, options: [], animations: {
            self.collectionView.insertItems(at: [indexPath])
        }, completion: {(finished) in
            layout.appearingIndexPath = nil
        })
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        let indexPaths = collectionView.indexPathsForSelectedItems!
        parksDataSource.deleteItemsAtIndexPaths(indexPaths)
        
        let layout = collectionViewLayout as! ParksViewFlowLayout
        layout.disapperingIndexPath = indexPaths
        
        UIView.animate(withDuration: 0.7, animations: {
            self.collectionView.deleteItems(at: indexPaths)
        }) { (finished) in
            layout.disapperingIndexPath = nil
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MasterViewController{
    
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
            cell.editing = isEditing
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
}

// MARK: -  UICollectionViewDelegate

extension MasterViewController{
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        addButton.isEnabled = !editing
        collectionView.allowsMultipleSelection = editing
        let indexPaths = collectionView.indexPathsForVisibleItems
        for indexPath in indexPaths {
            collectionView.deselectItem(at: indexPath, animated: false)
            let cell = collectionView.cellForItem(at: indexPath) as! ParkCollectionViewCell
            cell.editing = editing
        }
        if !editing{
            navigationController?.setToolbarHidden(true, animated: animated)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing{
            if let nationalPark = parksDataSource.parkForItemAtIndexPath(indexPath){
                performSegue(withIdentifier: "MasterToDetail", sender: nationalPark)
            }
        }else{
            navigationController?.setToolbarHidden(false, animated: true)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isEditing{
            if collectionView.indexPathsForSelectedItems?.count == 0{
                navigationController?.setToolbarHidden(true, animated: true)
            }
        }
    }
}
