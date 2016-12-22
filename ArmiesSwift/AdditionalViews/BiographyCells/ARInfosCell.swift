//
//  ARInfosCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARInfosCell                               : UITableViewCell {

	@IBOutlet fileprivate weak var nameLabel		: UILabel?
	@IBOutlet fileprivate weak var yearsLabel		: UILabel?
	@IBOutlet fileprivate weak var cityLabel		: UILabel?
	@IBOutlet fileprivate weak var yearsSkating		: UILabel?
    
	// MARK: - Public Methods

    func setupCell(_ skater: ARSkater?) {
        self.nameLabel?.text = skater?.name
        self.cityLabel?.text = skater?.city
        self.yearsLabel?.text = skater?.occupation
        self.yearsSkating?.text = skater?.favoriteMovie
	}
}
