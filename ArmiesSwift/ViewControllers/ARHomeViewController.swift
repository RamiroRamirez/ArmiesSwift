//
//  ARHomeViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import iCarousel

class ARHomeViewController		: ARViewController {

	//MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Home.titleMenu()
	}
    
    //MARK: - Actions
    
    @IBAction func twitterButtonPressed(sender: AnyObject) {
        self.slidingViewController().anchorTopViewToLeftAnimated(true)
    }
}
