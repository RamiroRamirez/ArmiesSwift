//
//  ARViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 13/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARViewController                          : UIViewController {
    
    // MARK: - Outlets

	@IBOutlet fileprivate weak var menuButton   : UIBarButtonItem?

	//MARK: - View Life cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		self.initialConfigurations()
	}

	//MARK: - Private Methods

	fileprivate func initialConfigurations() {
		self.menuButton?.title = NSLocalizedString("MENU", comment: "")
	}

	//MARK: - Actions

	@IBAction private func menuButtonPressed(_ sender: AnyObject) {
		self.slidingViewController().anchorTopViewToRight(animated: true)
	}
}
