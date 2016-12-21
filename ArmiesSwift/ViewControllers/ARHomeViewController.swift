//
//  ARHomeViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import iCarousel

enum ARHomeCell       : Int {
    case firstText = 0
    case firstImage
    case secondText
    case secondImage
    case thirdImage
    case thirdText
    case skaters
    
    static func allValues() -> [ARHomeCell] {
        return [.firstText, .firstImage, .secondText, .secondImage, .thirdImage, .thirdText, .skaters]
    }
    
    func cell(_ tableView: UITableView?) -> UITableViewCell? {
        switch self {
        case .firstText     : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .firstImage    : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .secondText    : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .secondImage   : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .thirdImage    : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .thirdText     : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .skaters       : return tableView?.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.HomeCells.SkatersCell.rawValue)
        }
    }
    
    func reuseCell() -> UITableViewCell? {
        switch self {
        case .firstText     : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .firstImage    : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .secondText    : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .secondImage   : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .thirdImage    : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .thirdText     : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .skaters       : return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.SkatersCell.rawValue)
        }
    }
    
    func text() -> String? {
        // TODO: Needs to be localised!!! This is just temporal
        switch self {
        case .firstText     : return "Armies es un grupo de patinadores mexicano radicando en la ciudad de Monterrey"
        case .firstImage    : return nil
        case .secondText    : return "Conoce nuestra app"
        case .secondImage   : return nil
        case .thirdImage    : return nil
        case .thirdText     : return "Conoce a los Skaters"
        case .skaters       : return nil
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .firstText     : return nil
        case .firstImage    : return UIImage(named: "ArmiesAll2.jpg")
        case .secondText    : return nil
        case .secondImage   : return UIImage(named: "ArmiesAll3.jpg")
        case .thirdImage    : return UIImage(named: "ArmiesAll4.jpg")
        case .thirdText     : return nil
        case .skaters       : return nil
        }
    }
    
    func heighCell() -> CGFloat {
        switch self {
        case .firstText     : return ARCellHeightConstants.HomeCells.textCell.rawValue
        case .firstImage    : return ARCellHeightConstants.HomeCells.imageCell.rawValue
        case .secondText    : return ARCellHeightConstants.HomeCells.textCell.rawValue
        case .secondImage   : return ARCellHeightConstants.HomeCells.imageCell.rawValue
        case .thirdImage    : return ARCellHeightConstants.HomeCells.imageCell.rawValue
        case .thirdText     : return ARCellHeightConstants.HomeCells.textCell.rawValue
        case .skaters       : return ARCellHeightConstants.HomeCells.skatersCell.rawValue
        }
    }
}

class ARHomeViewController                  : ARViewController {

	//MARK: - Outlets

    @IBOutlet fileprivate weak var tableView    : UITableView?
    
	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	fileprivate func initialConfigurations() {
		self.title = ARMenuOption.home.titleMenu()
	}
    
    //MARK: - Actions
    
    @IBAction func twitterButtonPressed(_ sender: AnyObject) {
        self.slidingViewController().anchorTopViewToLeft(animated: true)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == ARSegues.OpenBiography.rawValue) {
            let skater = sender as? ARSkater
            let vc = segue.destination as? ARBiographyViewController
            vc?.skater = skater
        }
    }
}

extension ARHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARHomeCell.allValues().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = ARHomeCell.allValues()[indexPath.row]
        if (cellType == .firstText || cellType == .secondText || cellType == .thirdText) {
            var cell = cellType.cell(tableView) as? ARTextHomeCell
            if (cell == nil) {
                cell = cellType.reuseCell() as? ARTextHomeCell
            }
            cell?.setupCell(cellType.text())
            return (cell ?? UITableViewCell())
            
        } else if (cellType == .firstImage || cellType == .secondImage || cellType == .thirdImage) {
            var cell = cellType.cell(tableView) as? ARImageHomeCell
            if (cell == nil) {
                cell = cellType.reuseCell() as? ARImageHomeCell
            }
            cell?.setupCell(cellType.image())
            return (cell ?? UITableViewCell())
            
        } else if (cellType == .skaters) {
            var cell = cellType.cell(tableView) as? ARSkatersCell
            if (cell == nil) {
                cell = cellType.reuseCell() as? ARSkatersCell
            }
            return (cell ?? UITableViewCell())
            
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = ARHomeCell.allValues()[indexPath.row]
        return cellType.heighCell()
    }
}

extension ARHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (ARSkateCreator.skaters?.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ARCellReuseIdentifier.HomeCells.SkaterCollectionCell.rawValue, for: indexPath) as? ARSkaterCollectionCell
        cell?.setupCell(skater: ARSkateCreator.skaters?[indexPath.row])
        // Configure the cell
        return (cell ?? UICollectionViewCell())
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: ARSegues.OpenBiography.rawValue, sender: ARSkateCreator.skaters?[indexPath.row])
    }
}
