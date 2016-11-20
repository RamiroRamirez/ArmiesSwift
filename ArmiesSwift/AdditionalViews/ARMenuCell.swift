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

	@IBOutlet private weak var menuImageView	: UIImageView?
	@IBOutlet private weak var menuTitleLabel	: UILabel?
    
    // MARK: - Cell Configuration Methods

    func setupCell(typeMenu: ARMenuOption?) {
		if let _iconMenu = typeMenu?.iconMenu() {
			self.menuImageView?.image = UIImage(named: _iconMenu)
			self.menuTitleLabel?.text = typeMenu?.titleMenu()
		}
	}
}
