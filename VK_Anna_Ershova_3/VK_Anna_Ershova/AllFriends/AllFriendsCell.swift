//
//  AllFriendsCell.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 26/12/2018.
//  Copyright © 2018 Anna Ershova. All rights reserved.
//

import UIKit

class AllFriendsCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var friendName: UILabel!

    
    
    
    // MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
