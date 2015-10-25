//
//  ARHomeViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import iCarousel

class ARHomeViewController		: ARViewController, iCarouselDelegate, iCarouselDataSource {

	//MARK: - Outlets

	@IBOutlet var carousel		: iCarousel?
	@IBOutlet var pageControl	: UIPageControl?

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Home.titleMenu()
		self.setupCarousel()

		// setup page control
		self.pageControl?.numberOfPages = Int(ARHarcodedConstants.numberOfImagesHomeView)
		self.pageControl?.currentPage = 0
	}

	private func setupCarousel() {
		self.carousel?.type = iCarouselTypeRotary
		self.carousel?.bounces = false;
		self.carousel?.clipsToBounds = true;
		self.carousel?.backgroundColor = UIColor.defaultColor()

		self.carousel?.delegate = self
		self.carousel?.dataSource = self
	}

	//MARK: - Implementation iCarouselDataSource Protocol

	func numberOfItemsInCarousel(carousel: iCarousel!) -> UInt {
		return ARHarcodedConstants.numberOfImagesHomeView
	}

	func carousel(carousel: iCarousel!, viewForItemAtIndex index: UInt, reusingView view: UIView!) -> UIView! {
		// if the view is nil, create a new one with the frame of the carousel view
		if (view == nil) {
			let imageView = UIImageView(frame: CGRectMake(0, 0, (self.carousel?.frame.size.width ?? 0), (self.carousel?.frame.size.height ?? 0)))
			imageView.image = UIImage(named: "MuestraCarousel.jpg")
			return imageView
		} else {
			let imageView = view as? UIImageView
			imageView?.image = UIImage(named: "MuestraCarousel.jpg")
			return imageView
		}
	}

	//MARK: - Implementation iCarouselDelegate Protocol

	func carouselCurrentItemIndexDidChange(carousel: iCarousel!) {
		self.pageControl?.currentPage = carousel.currentItemIndex
	}
}
