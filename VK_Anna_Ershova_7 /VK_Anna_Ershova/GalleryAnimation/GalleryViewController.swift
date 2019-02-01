//
//  GalleryViewController.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 1/31/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    
    //@IBOutlet private weak var bestFriend: UIImageView!

    var bestFriends = ["Chloe", "Jade", "Sasha", "Yasmin", "Cameron", "Dipper", "Mabel", "Stanly"]
    let minimumInteritemSpacing: CGFloat = 8
    var insetForSection: UIEdgeInsets {
        return UIEdgeInsets(top: 10,
                            left: minimumInteritemSpacing * 2,
                            bottom: 0,
                            right: minimumInteritemSpacing * 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout.scrollDirection = .horizontal
        
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = false
    }

}

// MARK: - UICollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestFriends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyItem", for: indexPath) as! GelleryViewControllerCellCollectionViewCell
        
        let img = bestFriends[indexPath.row]
        cell.bestFriend.image = UIImage(named: img)
        
        return cell
    }
}




// MARK: - UICollectionViewDelegateFlowLayout

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - insetForSection.left - insetForSection.right,
                      height: view.bounds.height - insetForSection.top - insetForSection.bottom)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
}


extension GalleryViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            return FlipPresentAnimationController(originFrame: collectionView.frame)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            guard let _ = dismissed as? NewsCollectionViewController else {
                return nil
            }
            return FlipDismissAnimationController(destinationFrame: collectionView.frame)
    }
}
