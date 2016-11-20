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

	@IBOutlet private var profileImageView			: UIImageView?
	@IBOutlet private var nameLabel					: UILabel?
	@IBOutlet private var cityLabel					: UILabel?
    
	// MARK: - Configuration Methods

    func setupCell(skater skater: ARSkater?) {
        self.configurateProfileImage(skater: skater)
	}

    private func configurateProfileImage(skater skater: ARSkater?) {
		self.profileImageView?.layer.borderWidth = 2.0
		self.profileImageView?.layer.borderColor = UIColor.whiteColor().CGColor
		self.profileImageView?.layer.cornerRadius = ((self.profileImageView?.frame.size.height ?? 0) * 0.5)
		self.profileImageView?.clipsToBounds = true
        
        self.profileImageView?.image = UIImage(named: (skater?.profileImage ?? ""))
        self.nameLabel?.text = skater?.name
        self.cityLabel?.text = skater?.city
	}
	
}
