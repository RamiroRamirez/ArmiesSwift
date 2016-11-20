//
//  ARInfosCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARInfosCell                               : UITableViewCell {

	@IBOutlet private weak var nameLabel		: UILabel?
	@IBOutlet private weak var yearsLabel		: UILabel?
	@IBOutlet private weak var cityLabel		: UILabel?
	@IBOutlet private weak var yearsSkating		: UILabel?
    
	// MARK: - Public Methods

    func setupCell(skater: ARSkater?) {
        self.nameLabel?.text = skater?.name
        self.cityLabel?.text = skater?.city
        self.yearsLabel?.text = skater?.occupation
        self.yearsSkating?.text = skater?.favoriteMovie
	}
}
