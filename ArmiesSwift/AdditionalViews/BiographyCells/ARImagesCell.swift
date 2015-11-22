//
//  ARImagesCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import iCarousel

class ARImageButton                     : UIButton {
    
    var image                           : UIImage?
}

class ARImagesCell						: UITableViewCell {

	@IBOutlet weak var photosTitleLabel	: UILabel?
	@IBOutlet weak var carousel			: iCarousel?
    @IBOutlet weak var pageControl      : UIPageControl?
    
    var skater                          : ARSkater?
    var imageSelected                   :((image: UIImage?) -> Void)? = nil

	// MARK: - Public Methods

	func setCell() {
		self.photosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_PHOTOS", comment: "")
		self.setupCarousel()
		self.carousel?.reloadData()
        self.pageControl?.numberOfPages = (self.skater?.images?.count ?? 0)
	}
    
    // MARK: - Public Methods
    
    func imagePressed(sender: ARImageButton?) {
        self.imageSelected?(image: sender?.image)
    }

	// MARK: - Private Methods

	private func setupCarousel() {
		self.carousel?.type = iCarouselTypeRotary
		self.carousel?.bounces = false
		self.carousel?.clipsToBounds = true
        self.carousel?.scrollSpeed = 0.5

		self.carousel?.delegate = self
		self.carousel?.dataSource = self
	}
}

extension ARImagesCell: iCarouselDataSource, iCarouselDelegate {
    
    //MARK: - Implementation iCarouselDataSource Protocol
    
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
        
        // create button
        let imageButton = ARImageButton()
        imageButton.frame = (imageView?.frame ?? CGRectZero)
        imageButton.backgroundColor = UIColor.clearColor()
        imageButton.addTarget(self, action: "imagePressed:", forControlEvents: .TouchDown)
        if let
            _image = self.skater?.images?[Int(index)] {
                imageView?.addSubview(imageButton)
                imageButton.image = UIImage(named: _image)
        }
        return imageView
    }

    //MARK: - Implementation iCarouselDelegate Protocol
    
    func carouselDidEndScrollingAnimation(carousel: iCarousel!) {
        self.pageControl?.currentPage = carousel.currentItemIndex
    }
}
