//
//  ARImagesCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import iCarousel

class ARImageButton                             : UIButton {
    
    var image                                   : UIImage?
}

class ARImagesCell                              : UITableViewCell {

	@IBOutlet fileprivate weak var photosTitleLabel	: UILabel?
	@IBOutlet fileprivate weak var carousel			: iCarousel?
    @IBOutlet fileprivate weak var pageControl      : UIPageControl?
    
    fileprivate var skater                          : ARSkater?
    fileprivate var imageSelected                   :((_ image: UIImage?) -> Void)? = nil

	// MARK: - Public Methods

    func setupCell(_ skater: ARSkater?, imageSelectedBlock: ((_ image: UIImage?) -> Void)?) {
        self.skater = skater
        self.imageSelected = imageSelectedBlock
		self.photosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_PHOTOS", comment: "")
		self.setupCarousel()
		self.carousel?.reloadData()
        self.pageControl?.numberOfPages = (self.skater?.images?.count ?? 0)
	}
    
    // MARK: - Public Methods
    
    func imagePressed(_ sender: ARImageButton?) {
        self.imageSelected?(sender?.image)
    }

	// MARK: - Private Methods

	fileprivate func setupCarousel() {
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
    
    func numberOfItems(in carousel: iCarousel!) -> UInt {
        return UInt(self.skater?.images?.count ?? 0)
    }
    
    func carousel(_ carousel: iCarousel!, viewForItemAt index: UInt, reusing view: UIView!) -> UIView! {
        // if the view is nil, create a new one with the frame of the carousel view
        var imageView : UIImageView?
        imageView = ((view == nil) ? UIImageView(frame: CGRect(x: 0, y: 0, width: (self.carousel?.frame.size.width ?? 0), height: (self.carousel?.frame.size.height ?? 0))) : view as? UIImageView)
        imageView?.contentMode = .scaleAspectFill
        if let _image = self.skater?.images?[Int(index)] {
            imageView?.image = UIImage(named: _image)
        }
        
        // create button
        let imageButton = ARImageButton()
        imageButton.frame = (imageView?.frame ?? CGRect.zero)
        imageButton.backgroundColor = UIColor.clear
        imageButton.addTarget(self, action: #selector(ARImagesCell.imagePressed(_:)), for: .touchDown)
        if let _image = self.skater?.images?[Int(index)] {
            imageView?.addSubview(imageButton)
            imageButton.image = UIImage(named: _image)
        }
        return imageView
    }

    //MARK: - Implementation iCarouselDelegate Protocol
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel!) {
        self.pageControl?.currentPage = carousel.currentItemIndex
    }
}
