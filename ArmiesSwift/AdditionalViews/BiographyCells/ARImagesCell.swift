//
//  ARImagesCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import iCarousel

class ARImagesCell						: UITableViewCell, iCarouselDataSource, iCarouselDelegate {

	@IBOutlet var photosTitleLabel		: UILabel?
	@IBOutlet var carousel				: iCarousel?
    
    var skater                          : ARSkater?

	// MARK: - Public Methods

	func setCell() {
		self.photosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_PHOTOS", comment: "")
		self.setupCarousel()
		self.carousel?.reloadData()
	}

	// MARK: - Private Methods

	private func setupCarousel() {
		self.carousel?.type = iCarouselTypeRotary
		self.carousel?.bounces = false;
		self.carousel?.clipsToBounds = true;

		self.carousel?.delegate = self
		self.carousel?.dataSource = self
	}

	func numberOfItemsInCarousel(carousel: iCarousel!) -> UInt {
        return UInt(self.skater?.images?.count ?? 0)
	}

	func carousel(carousel: iCarousel!, viewForItemAtIndex index: UInt, reusingView view: UIView!) -> UIView! {
		// if the view is nil, create a new one with the frame of the carousel view
		var imageView : UIImageView?
		imageView = ((view == nil) ? UIImageView(frame: CGRectMake(0, 0, (self.carousel?.frame.size.width ?? 0), (self.carousel?.frame.size.height ?? 0))) : view as? UIImageView)
        imageView?.contentMode = .ScaleAspectFill
        if let _image = self.skater?.images?[Int(index)] {
            imageView?.image = UIImage(named: _image)
        }
		return imageView
	}
}
