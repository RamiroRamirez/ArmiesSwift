//
//  ARSkaterCollectionCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 15/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARSkaterCollectionCell            : UICollectionViewCell {
    
    @IBOutlet weak var skaterImageView  : UIImageView?
    @IBOutlet weak var skaterNameLabel  : UILabel?
    
    func setCell() {
        self.skaterImageView?.layer.borderWidth = 2.0
        self.skaterImageView?.layer.borderColor = UIColor.whiteColor().CGColor
        self.backgroundColor = UIColor.clearColor()
        
        self.skaterImageView?.layer.cornerRadius = ((self.skaterImageView?.frame.height ?? 0) * 0.5)
        self.skaterImageView?.clipsToBounds = true
    }

}
