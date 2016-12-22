//
//  ARSkaterCollectionCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 15/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARSkaterCollectionCell                    : UICollectionViewCell {
    
    @IBOutlet fileprivate weak var skaterImageView  : UIImageView?
    @IBOutlet fileprivate weak var skaterNameLabel  : UILabel?
    
    func setupCell(skater: ARSkater?) {
        self.skaterImageView?.layer.borderWidth = 2.0
        self.skaterImageView?.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = UIColor.clear
        
        self.skaterImageView?.layer.cornerRadius = ((self.skaterImageView?.frame.height ?? 0) * 0.5)
        self.skaterImageView?.clipsToBounds = true
        
        self.skaterImageView?.image = UIImage(named: (skater?.profileImage ?? ""))
        self.skaterNameLabel?.text = skater?.name
    }

}
