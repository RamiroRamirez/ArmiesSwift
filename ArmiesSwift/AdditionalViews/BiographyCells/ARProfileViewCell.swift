//
//  ARProfileViewCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARProfileViewCell                             : UITableViewCell {

	@IBOutlet private var panoramPhotoImageView		: UIImageView?
	@IBOutlet private var profilPhotoImageView		: UIImageView?

    func setupCell(profilePhoto: UIImage?, panoramaPhoto: UIImage?) {
		self.configurateProfileImage()
        self.profilPhotoImageView?.image = profilePhoto
        self.panoramPhotoImageView?.image = panoramaPhoto
	}

	//MARK: - Private methods

	private func configurateProfileImage() {
		self.profilPhotoImageView?.layer.borderWidth = 2.0
		self.profilPhotoImageView?.layer.borderColor = UIColor.whiteColor().CGColor
		self.profilPhotoImageView?.layer.cornerRadius = ((self.profilPhotoImageView?.frame.size.height ?? 0) * 0.5)
		self.profilPhotoImageView?.clipsToBounds = true
	}
}
