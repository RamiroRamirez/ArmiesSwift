//
//  ARSkaterCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARSkaterCell                                  : UITableViewCell {
    
    // MARK: - IBOutlets

	@IBOutlet fileprivate weak var profileImageView		: UIImageView?
	@IBOutlet fileprivate weak var nameLabel			: UILabel?
	@IBOutlet fileprivate weak var cityLabel			: UILabel?
    
	// MARK: - Configuration Methods

    func setupCell(skater: ARSkater?) {
        self.configurateProfileImage(skater: skater)
	}

    fileprivate func configurateProfileImage(skater: ARSkater?) {
		self.profileImageView?.layer.borderWidth = 2.0
		self.profileImageView?.layer.borderColor = UIColor.white.cgColor
		self.profileImageView?.layer.cornerRadius = ((self.profileImageView?.frame.size.height ?? 0) * 0.5)
		self.profileImageView?.clipsToBounds = true
        
        self.profileImageView?.image = UIImage(named: (skater?.profileImage ?? ""))
        self.nameLabel?.text = skater?.name
        self.cityLabel?.text = skater?.city
	}
	
}
