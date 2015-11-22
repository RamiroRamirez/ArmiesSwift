//
//  ARSkaterCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARSkaterCell							: UITableViewCell {

	@IBOutlet var profileImageView			: UIImageView?
	@IBOutlet var nameLabel					: UILabel?
	@IBOutlet var cityLabel					: UILabel?
    
    var skater                              : ARSkater?

	//MARK: - Public Methods

	func setCell() {
		self.configurateProfileImage()
	}

	private func configurateProfileImage() {
		self.profileImageView?.layer.borderWidth = 2.0
		self.profileImageView?.layer.borderColor = UIColor.whiteColor().CGColor
		self.profileImageView?.layer.cornerRadius = ((self.profileImageView?.frame.size.height ?? 0) * 0.5)
		self.profileImageView?.clipsToBounds = true
        
        self.profileImageView?.image = UIImage(named: (self.skater?.profileImage ?? ""))
        self.nameLabel?.text = self.skater?.name
        self.cityLabel?.text = self.skater?.city
	}
	
}
