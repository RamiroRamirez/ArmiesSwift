//
//  ARMenuViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

enum ARMenuOption 		: Int {
	case home = 0
	case biographies
	case videos
	case images

	static func allValues() -> [ARMenuOption] {
		return [.home, .biographies, .videos, .images]
	}

	func titleMenu() -> String? {
		switch self {
		case .home			: return NSLocalizedString("MENU_HOME", comment: "")
		case .biographies	: return NSLocalizedString("MENU_BIOGRAPHY", comment: "")
		case .videos 		: return NSLocalizedString("MENU_VIDEOS", comment: "")
		case .images		: return NSLocalizedString("MENU_IMAGES", comment: "")
		}
	}

	func iconMenu() -> String? {
		switch (self) {
		case .home			: return "ic_home.png"
		case .biographies	: return "ic_skaters.png"
		case .videos 		: return "ic_videos.png"
		case .images		: return "ic_imagenes.png"
		}
	}

	func topViewToShow() -> String {
		switch self {
		case .home 			: return ARStoryboardIds.HomeViewController.rawValue
		case .biographies	: return ARStoryboardIds.BiographiesViewController.rawValue
		case .videos		: return ARStoryboardIds.VideosViewController.rawValue
		case .images		: return ARStoryboardIds.ImagesViewController.rawValue
		}
	}
}

class ARMenuViewController                  : UIViewController {
    
    //MARK: - IBOutlets

	@IBOutlet fileprivate weak var tableView    : UITableView?

	//MARK: - View Life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private methods

	fileprivate func initialConfigurations() {
        self.slidingViewController().topViewAnchoredGesture = [.tapping, .custom]
    }

	fileprivate func showTopView(_ menuOption: ARMenuOption?) {
		if let _topViewToShow = menuOption?.topViewToShow() {
			self.slidingViewController().topViewController = self.storyboard?.instantiateViewController(withIdentifier: _topViewToShow) as? UINavigationController
		}
	}
}

extension ARMenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: -Implementation UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARMenuOption.allValues().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.MenuCells.MenuCell.rawValue) as?  ARMenuCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: ARCellReuseIdentifier.MenuCells.MenuCell.rawValue) as? ARMenuCell
        }
        cell?.setupCell(ARMenuOption.allValues()[indexPath.row])
        return (cell ?? UITableViewCell())
    }
    
    //MARK: -Implementation UITableViewDelegate Protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showTopView(ARMenuOption.allValues()[indexPath.row])
        self.slidingViewController().resetTopView(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ARCellHeightConstants.MenuCells.menuCell.rawValue
    }
}
