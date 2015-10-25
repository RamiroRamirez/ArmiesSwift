//
//  ARMenuCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 04/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARMenuCell					: UITableViewCell {

	@IBOutlet var menuImageView		: UIImageView?
	@IBOutlet var menuTitleLabel	: UILabel?

	var typeMenu					: ARMenuOption?

	func setCell() {
		if let _iconMenu = self.typeMenu?.iconMenu() {
			self.menuImageView?.image = UIImage(named: _iconMenu)
			self.menuTitleLabel?.text = self.typeMenu?.titleMenu()
		}
	}
}
