//
//  AllFriendsController.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 26/12/2018.
//  Copyright © 2018 Anna Ershova. All rights reserved.
//

import UIKit
import Foundation


class AllFriendsController: UITableViewController {
    
    // MARK: Private Properties
    private var friends = ["Cameron", "Chloe", "Jade", "Sasha", "Yasmin", "Clover", "Dylan", "Dipper", "Stanly", "Mabel", "Mary", "Cloe", "Jared", "Sam", "Yasmie"].sorted(by: {$0 < $1})
   
    private var images = ["Cameron.jpg", "Chloe.jpg", "Jade.jpg", "Sasha.jpg", "b.jpg", "Yasmin.jpg"]
    
    private var friendsIndexTitles = ["C", "D", "J", "M", "S", "Y"]
    
    var dividedArray: NSMutableArray = []
    var imgArr: NSMutableArray = []
    
    

    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        for index in friendsIndexTitles{
            let helpArray: NSMutableArray = []
            for jndex in friends {
                if index.first!  == jndex.first! {
                    helpArray.add(jndex)
                }
            }
            dividedArray.add(helpArray)
        }
        
        for index in friendsIndexTitles{
            let helpImgArray: NSMutableArray = []
            for jndex in images {
                if index.first!  == jndex.first! {
                    helpImgArray.add(jndex)
                }
            }
            imgArr.add(helpImgArray)
        }
        
    }




    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsIndexTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dividedArray[section] as! NSMutableArray).count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! AllFriendsCell
        
        
//        let friendKey = friendsSection[indexPath.section]
//        friendsDictionary[friendKey] != nil
        
        
        let helpArray = dividedArray[indexPath.section] as! NSMutableArray

        let friend = helpArray[indexPath.row] as? String
        cell.friendName.text = friend
    

        
        let img = images[indexPath.row]
        cell.imageName.image = UIImage(named: img)
        
        // container for image
        let myImage = UIImageView(frame: cell.imageName.bounds)
        myImage.clipsToBounds = true
        myImage.layer.cornerRadius = 10
        cell.imageName.addSubview(myImage)
        

        
        return cell
    }
    

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.friendsIndexTitles
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    internal override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.friendsIndexTitles[section] as String
    }
    
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            let destinationVC : PhotoCollectionController = segue.destination as! PhotoCollectionController
            let sourceVC = segue.source as! AllFriendsController
            if let indexPath = sourceVC.tableView.indexPathForSelectedRow {
                let photoFriend = sourceVC.images[indexPath.section]
                    destinationVC.photoFriend = photoFriend
            }
        }

}
    
    
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return friendsIndexTitles
//    }
//
//    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        return friendsIndexTitles.index(of: title)!
//    }
    
    

}



