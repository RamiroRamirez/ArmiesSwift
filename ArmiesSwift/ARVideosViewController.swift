//
//  ARVideosViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

enum ARVideoSection : Int {
    
    case BestTricks = 0
    case TrickTips
    case Translation
    case Film
    
    static func allValues() -> [ARVideoSection] {
        return [.BestTricks, .TrickTips, .Translation, .Film]
    }
    
    func title() -> String? {
        switch(self) {
        case .BestTricks:       return ""
        case .TrickTips:        return ""
        case .Translation:      return ""
        case .Film:             return ""
        }
    }
}

class ARVideosViewController: ARViewController {

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Videos.titleMenu()
	}

	//MARK: - Actions
}

extension ARVideosViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Implementation UITAbleViewDataSource Protocol
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
