//
//  ARSettingsViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARSettingsViewController: ARViewController {

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Settings.titleMenu()
	}

	//MARK: - Actions

}
