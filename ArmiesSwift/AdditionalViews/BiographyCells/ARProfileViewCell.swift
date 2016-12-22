//
//  ARProfileViewCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARProfileViewCell                             : UITableViewCell {

	@IBOutlet fileprivate var panoramPhotoImageView		: UIImageView?
	@IBOutlet fileprivate var profilPhotoImageView		: UIImageView?

    func setupCell(_ profilePhoto: UIImage?, panoramaPhoto: UIImage?) {
		self.configurateProfileImage()
        self.profilPhotoImageView?.image = profilePhoto
        self.panoramPhotoImageView?.image = panoramaPhoto
	}

	//MARK: - Private methods

	fileprivate func configurateProfileImage() {
		self.profilPhotoImageView?.layer.borderWidth = 2.0
		self.profilPhotoImageView?.layer.borderColor = UIColor.white.cgColor
		self.profilPhotoImageView?.layer.cornerRadius = ((self.profilPhotoImageView?.frame.size.height ?? 0) * 0.5)
		self.profilPhotoImageView?.clipsToBounds = true
	}
}
