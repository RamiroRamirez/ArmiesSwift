//
//  ARListBiographiesViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARListBiographiesViewController: ARViewController, UITableViewDataSource, UITableViewDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	// MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Biographies.titleMenu()
	}

	// MARK: - Implementation UITableViewDataSource Protocol

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.SkaterCells.SkaterCell.rawValue) as? ARSkaterCell
		if (cell == nil) {
			cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ARCellReuseIdentifier.SkaterCells.SkaterCell.rawValue) as? ARSkaterCell
		}
		cell?.setCell()
		return (cell ?? UITableViewCell())
	}

	// MARK: - Implementation UITableViewDelegate Protocol

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		self.performSegueWithIdentifier(ARSegues.OpenBiography.rawValue, sender: nil)
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return ARCellHeightConstants.SkaterCells.SkaterCell.rawValue
	}
}
