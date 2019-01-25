//
//  NewsCollectionViewController.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 1/22/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

import UIKit

class NewsCollectionViewController: UICollectionViewController {
    
    var newsAll = ["Chloe", "Jade", "Sasha", "Yasmin", "Cameron", "Dipper", "Mabel", "Stanly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsAll.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsImg", for: indexPath) as! NewsCollectionViewCell
        
        let photo = newsAll[indexPath.row]
        cell.imgNews.image = UIImage(named: photo)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        let opacityUp = CABasicAnimation(keyPath: "opacity")
        opacityUp.beginTime = CACurrentMediaTime()
        opacityUp.fromValue = 0
        opacityUp.toValue = 1
        opacityUp.duration = 0.8
        opacityUp.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        cell.layer.add(opacityUp, forKey: nil)
        
        let scaleUp = CABasicAnimation(keyPath: "transform.scale")
        scaleUp.beginTime = CACurrentMediaTime()
        scaleUp.fromValue = 0.5
        scaleUp.toValue = 1
        scaleUp.duration = 0.8
        scaleUp.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        cell.layer.add(scaleUp, forKey: nil)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let opacityDown = CABasicAnimation(keyPath: "opacity")
        opacityDown.beginTime = CACurrentMediaTime()
        opacityDown.fromValue = 1
        opacityDown.toValue = 0
        opacityDown.duration = 0.8
        opacityDown.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        cell.layer.add(opacityDown, forKey: nil)
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.beginTime = CACurrentMediaTime()
        scaleDown.fromValue = 1
        scaleDown.toValue = 0.5
        scaleDown.duration = 0.8
        scaleDown.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        cell.layer.add(scaleDown, forKey: nil)
        
    }
    
    
    
}
