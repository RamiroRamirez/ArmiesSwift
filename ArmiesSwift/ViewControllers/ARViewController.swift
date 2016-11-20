//
//  ARViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 13/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARViewController                      : UIViewController {

	@IBOutlet private weak var menuButton   : UIBarButtonItem?

	//MARK: - View Life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.menuButton?.title = NSLocalizedString("MENU", comment: "")
	}

	//MARK: - Actions

	@IBAction func menuButtonPressed(sender: AnyObject) {
		self.slidingViewController().anchorTopViewToRightAnimated(true)
	}
}
