//
//  ARInfosCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARInfosCell					: UITableViewCell {

	@IBOutlet var nameLabel			: UILabel?
	@IBOutlet var yearsLabel		: UILabel?
	@IBOutlet var cityLabel			: UILabel?
	@IBOutlet var yearsSkating		: UILabel?
    
    var skater                      : ARSkater?

	//MARK: - Public Methods

	func setCell() {
        self.nameLabel?.text = self.skater?.name
        self.cityLabel?.text = self.skater?.city
        self.yearsLabel?.text = self.skater?.occupation
        self.yearsSkating?.text = self.skater?.favoriteMovie
	}

	//MARK: - Private Methods

}
