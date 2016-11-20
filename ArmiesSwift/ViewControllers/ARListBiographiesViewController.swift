//
//  ARListBiographiesViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARListBiographiesViewController	: ARViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.initialConfigurations()
	}

	// MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Biographies.titleMenu()
	}
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == ARSegues.OpenBiography.rawValue) {
            let sender = sender as? ARSkater
            let vc = segue.destinationViewController as? ARBiographyViewController
            vc?.skater = sender
        }
    }
}

extension ARListBiographiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ARSkateCreator.skaters?.count ?? 0)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.SkaterCells.SkaterCell.rawValue) as? ARSkaterCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ARCellReuseIdentifier.SkaterCells.SkaterCell.rawValue) as? ARSkaterCell
        }
        cell?.setupCell(skater: ARSkateCreator.skaters?[indexPath.row])
        return (cell ?? UITableViewCell())
    }
    
    // MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(ARSegues.OpenBiography.rawValue, sender: ARSkateCreator.skaters?[indexPath.row])
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ARCellHeightConstants.SkaterCells.SkaterCell.rawValue
    }
}
