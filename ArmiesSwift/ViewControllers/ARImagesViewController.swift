//
//  ARImagesViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARImagesViewController                        : ARCollectionViewController {
    
	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	fileprivate func initialConfigurations() {
		self.title = ARMenuOption.images.titleMenu()
        self.createImageArray(withBasicString: "InstagramArmies")
	}
}
