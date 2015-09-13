//
//  ARMenuViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

enum ARMenuOption 		: Int {
	case Home = 0
	case Biographies
	case Videos
	case Images
	case Instagram
	case Settings

	static func allValues() -> [ARMenuOption] {
		return [.Home, .Biographies, .Videos, .Images, .Instagram, .Settings]
	}

	func titleMenu() -> String? {
		switch self {
		case .Home			: return NSLocalizedString("MENU_HOME", comment: "")
		case .Biographies	: return NSLocalizedString("MENU_BIOGRAPHY", comment: "")
		case .Videos 		: return NSLocalizedString("MENU_VIDEOS", comment: "")
		case .Images		: return NSLocalizedString("MENU_IMAGES", comment: "")
		case .Instagram		: return NSLocalizedString("MENU_INSTAGRAM", comment: "")
		case .Settings		: return NSLocalizedString("MENU_SETTINGS", comment: "")
		}
	}

	func topViewToShow() -> String {
		switch self {
		case .Home 			: return ARStoryboardIds.HomeViewController.rawValue
		case .Biographies	: return ARStoryboardIds.BiographiesViewController.rawValue
		case .Videos		: return ARStoryboardIds.VideosViewController.rawValue
		case .Images		: return ARStoryboardIds.ImagesViewController.rawValue
		case .Instagram		: return ARStoryboardIds.InstagramViewController.rawValue
		case .Settings		: return ARStoryboardIds.SettingsViewController.rawValue
		}
	}
}

class ARMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet var tableView: UITableView?

	//MARK: - View Life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private methods

	private func initialConfigurations() {
		self.slidingViewController().topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesture.Tapping | ECSlidingViewControllerAnchoredGesture.Custom
	}

	private func showTopView(menuOption: ARMenuOption?) {
		if let _topViewToShow = menuOption?.topViewToShow() {
			self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier(_topViewToShow) as? UINavigationController
		}
	}

	//MARK: -Implementation UITableViewDataSource Protocol

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ARMenuOption.allValues().count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.MenuCell.rawValue) as?  UITableViewCell
		if (cell == nil) {
			cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ARCellReuseIdentifier.MenuCell.rawValue)
		}
		cell?.textLabel?.text = ARMenuOption.allValues()[indexPath.row].titleMenu()
		return (cell ?? UITableViewCell())
	}

	//MARK: -Implementation UITableViewDelegate Protocol

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.showTopView(ARMenuOption.allValues()[indexPath.row])
		self.slidingViewController().resetTopViewAnimated(true)
	}

}
