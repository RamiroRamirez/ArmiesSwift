//
//  ARBiographyViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

enum ARBiographyCell : Int {

	case ProfileImagesCell = 0
	case InfoCell
	case PhotosCell
	case VideosCell

	static func allValues() -> [ARBiographyCell] {
		return [.ProfileImagesCell, .InfoCell, .PhotosCell, .VideosCell]
	}

	func returnReuseId() -> String? {
		switch self {
		case .ProfileImagesCell     	: return ARCellReuseIdentifier.BiographyCells.ProfileImageCell.rawValue
		case .InfoCell      			: return ARCellReuseIdentifier.BiographyCells.InfoCell.rawValue
		case .PhotosCell        		: return ARCellReuseIdentifier.BiographyCells.PhotosCell.rawValue
		case .VideosCell                : return ARCellReuseIdentifier.BiographyCells.VideosCell.rawValue
		}
	}

	func returnBiographyCell(tableView: UITableView?) -> AnyObject? {
		if let _reuseId = self.returnReuseId() {
			switch self {
			case .ProfileImagesCell 	: return tableView?.dequeueReusableCellWithIdentifier(_reuseId) as? ARProfileViewCell
			case .InfoCell      		: return tableView?.dequeueReusableCellWithIdentifier(_reuseId) as? ARInfosCell
			case .PhotosCell       		: return tableView?.dequeueReusableCellWithIdentifier(_reuseId) as? ARImagesCell
			case .VideosCell         	: return tableView?.dequeueReusableCellWithIdentifier(_reuseId) as? ARVideosCell
			}
		}
		return nil
	}

	func cellHeight() -> CGFloat {
		switch self {
		case .ProfileImagesCell     	: return ARCellHeightConstants.BiographyCells.ProfileImageCell.rawValue
		case .InfoCell          		: return ARCellHeightConstants.BiographyCells.InfoCell.rawValue
		case .PhotosCell            	: return ARCellHeightConstants.BiographyCells.ImagesCell.rawValue
		case .VideosCell            	: return ARCellHeightConstants.BiographyCells.VideosCell.rawValue
		}
	}

}

class ARBiographyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Biographies.titleMenu()
	}

	//MARK: - Actions

	//MARK: - Implementation UITableViewDataSource Protocol

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ARBiographyCell.allValues().count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellType = ARBiographyCell.allValues()[indexPath.row]
		switch cellType {
		case .ProfileImagesCell:
			let cell = cellType.returnBiographyCell(tableView) as? ARProfileViewCell
			cell?.setCell()
			return (cell ?? UITableViewCell())
		case .InfoCell:
			let cell = cellType.returnBiographyCell(tableView) as? ARInfosCell
			return (cell ?? UITableViewCell())
		case .PhotosCell:
			let cell = cellType.returnBiographyCell(tableView) as? ARImagesCell
			cell?.setCell()
			return (cell ?? UITableViewCell())
		case .VideosCell:
			let cell = cellType.returnBiographyCell(tableView) as? ARVideosCell
			return (cell ?? UITableViewCell())
		}
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let cellType = ARBiographyCell.allValues()[indexPath.row]
		return cellType.cellHeight()
	}
}
