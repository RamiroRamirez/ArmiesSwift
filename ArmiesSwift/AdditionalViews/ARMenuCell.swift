//
//  ARMenuCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 04/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARMenuCell                                : UITableViewCell {
    
    // MARK: - IBOutlets

	@IBOutlet fileprivate weak var menuImageView	: UIImageView?
	@IBOutlet fileprivate weak var menuTitleLabel	: UILabel?
    
    // MARK: - Cell Configuration Methods

    func setupCell(_ typeMenu: ARMenuOption?) {
		if let _iconMenu = typeMenu?.iconMenu() {
			self.menuImageView?.image = UIImage(named: _iconMenu)
			self.menuTitleLabel?.text = typeMenu?.titleMenu()
		}
	}
}
