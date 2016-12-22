//
//  ARBiographyViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

enum ARBiographyCell : Int {

	case profileImagesCell = 0
	case infoCell
	case photosCell
	case videosCell

	static func allValues() -> [ARBiographyCell] {
		return [.profileImagesCell, .infoCell, .photosCell, .videosCell]
	}

	func returnReuseId() -> String? {
		switch self {
		case .profileImagesCell     	: return ARCellReuseIdentifier.BiographyCells.ProfileImageCell.rawValue
		case .infoCell      			: return ARCellReuseIdentifier.BiographyCells.InfoCell.rawValue
		case .photosCell        		: return ARCellReuseIdentifier.BiographyCells.PhotosCell.rawValue
		case .videosCell                : return ARCellReuseIdentifier.BiographyCells.VideosCell.rawValue
		}
	}

	func returnBiographyCell(_ tableView: UITableView?) -> AnyObject? {
		if let _reuseId = self.returnReuseId() {
			switch self {
			case .profileImagesCell 	: return tableView?.dequeueReusableCell(withIdentifier: _reuseId) as? ARProfileViewCell
			case .infoCell      		: return tableView?.dequeueReusableCell(withIdentifier: _reuseId) as? ARInfosCell
			case .photosCell       		: return tableView?.dequeueReusableCell(withIdentifier: _reuseId) as? ARImagesCell
			case .videosCell         	: return tableView?.dequeueReusableCell(withIdentifier: _reuseId) as? ARVideosCell
			}
		}
		return nil
	}

	func cellHeight() -> CGFloat {
		switch self {
		case .profileImagesCell     	: return ARCellHeightConstants.BiographyCells.profileImageCell.rawValue
		case .infoCell          		: return ARCellHeightConstants.BiographyCells.infoCell.rawValue
		case .photosCell            	: return ARCellHeightConstants.BiographyCells.imagesCell.rawValue
		case .videosCell            	: return ARCellHeightConstants.BiographyCells.videosCell.rawValue
		}
	}

}

class ARBiographyViewController : UIViewController {
    
    var skater                  : ARSkater?

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        
		self.initialConfigurations()
	}
    
    //MARK: - Private Methods

    func openImageViewerFromCarrousel(_ image: UIImage?) {
        self.performSegue(withIdentifier: ARSegues.OpenImageViewer.rawValue, sender: image)
    }

    @IBAction func openImageViewer(_ sender: AnyObject) {
        self.performSegue(withIdentifier: ARSegues.OpenImageViewer.rawValue, sender: nil)
    }
    
	//MARK: - Private Methods

	fileprivate func initialConfigurations() {
		self.title = ARMenuOption.biographies.titleMenu()
	}
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == ARSegues.OpenImageViewer.rawValue) {
            let vc = segue.destination as? ARImageViewerViewController
            if (sender == nil) {
                vc?.armieImage = UIImage(named: (self.skater?.profileImage ?? ""))
            } else {
                let image = sender as? UIImage
                vc?.armieImage = image
            }
        }
    }
}

extension ARBiographyViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARBiographyCell.allValues().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = ARBiographyCell.allValues()[indexPath.row]
        switch cellType {
        case .profileImagesCell:
            let cell = cellType.returnBiographyCell(tableView) as? ARProfileViewCell
            if let _profileImage = self.skater?.profileImage {
                cell?.setupCell(UIImage(named: _profileImage), panoramaPhoto: UIImage(named: _profileImage))
            }
            return (cell ?? UITableViewCell())
        case .infoCell:
            let cell = cellType.returnBiographyCell(tableView) as? ARInfosCell
            cell?.setupCell(self.skater)
            return (cell ?? UITableViewCell())
        case .photosCell:
            let cell = cellType.returnBiographyCell(tableView) as? ARImagesCell
            cell?.setupCell(self.skater, imageSelectedBlock: self.openImageViewerFromCarrousel)
            return (cell ?? UITableViewCell())
        case .videosCell:
            let cell = cellType.returnBiographyCell(tableView) as? ARVideosCell
            cell?.setupCell(skater: self.skater)
            return (cell ?? UITableViewCell())
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = ARBiographyCell.allValues()[indexPath.row]
        return cellType.cellHeight()
    }
}
