//
//  ARVideosCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARVideosCell						: UITableViewCell {

	@IBOutlet var videosTitleLabel		: UILabel?

	// MARK: - Public Methods

	func setCell() {
		self.videosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_VIDEOS", comment: "")
	}
}
