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
    case FirstText = 0
    case FirstImage
    case SecondText
    case SecondImage
    case ThirdImage
    case ThirdText
    case Skaters
    
    static func allValues() -> [ARHomeCell] {
        return [.FirstText, .FirstImage, .SecondText, .SecondImage, .ThirdImage, .ThirdText, .Skaters]
    }
    
    func cell(tableView: UITableView?) -> UITableViewCell? {
        switch self {
        case .FirstText     : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .FirstImage    : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .SecondText    : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .SecondImage   : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .ThirdImage    : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .ThirdText     : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .Skaters       : return tableView?.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.HomeCells.SkatersCell.rawValue)
        }
    }
    
    func reuseCell() -> UITableViewCell? {
        switch self {
        case .FirstText     : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .FirstImage    : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .SecondText    : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .SecondImage   : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .ThirdImage    : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.ImageCell.rawValue)
        case .ThirdText     : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.TextCell.rawValue)
        case .Skaters       : return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.HomeCells.SkatersCell.rawValue)
        }
    }
    
    func text() -> String? {
        // TODO: Needs to be localised!!! This is just temporal
        switch self {
        case .FirstText     : return "Armies es un grupo de patinadores mexicano radicando en la ciudad de Monterrey"
        case .FirstImage    : return nil
        case .SecondText    : return "Conoce nuestra app"
        case .SecondImage   : return nil
        case .ThirdImage    : return nil
        case .ThirdText     : return "Conoce a los Skaters"
        case .Skaters       : return nil
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .FirstText     : return nil
        case .FirstImage    : return UIImage(named: "ArmiesAll2.jpg")
        case .SecondText    : return nil
        case .SecondImage   : return UIImage(named: "ArmiesAll3.jpg")
        case .ThirdImage    : return UIImage(named: "ArmiesAll4.jpg")
        case .ThirdText     : return nil
        case .Skaters       : return nil
        }
    }
    
    func heighCell() -> CGFloat {
        switch self {
        case .FirstText     : return ARCellHeightConstants.HomeCells.TextCell.rawValue
        case .FirstImage    : return ARCellHeightConstants.HomeCells.ImageCell.rawValue
        case .SecondText    : return ARCellHeightConstants.HomeCells.TextCell.rawValue
        case .SecondImage   : return ARCellHeightConstants.HomeCells.ImageCell.rawValue
        case .ThirdImage    : return ARCellHeightConstants.HomeCells.ImageCell.rawValue
        case .ThirdText     : return ARCellHeightConstants.HomeCells.TextCell.rawValue
        case .Skaters       : return ARCellHeightConstants.HomeCells.SkatersCell.rawValue
        }
    }
}

class ARHomeViewController          : ARViewController {

	//MARK: - Outlets

    @IBOutlet weak var tableView    : UITableView?
    
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
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == ARSegues.OpenBiography.rawValue) {
            let skater = sender as? ARSkater
            let vc = segue.destinationViewController as? ARBiographyViewController
            vc?.skater = skater
        }
    }
}

extension ARHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARHomeCell.allValues().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellType = ARHomeCell.allValues()[indexPath.row]
        if (cellType == .FirstText || cellType == .SecondText || cellType == .ThirdText) {
            var cell = cellType.cell(tableView) as? ARTextHomeCell
            if (cell == nil) {
                cell = cellType.reuseCell() as? ARTextHomeCell
            }
            cell?.setupCell(cellType.text())
            return (cell ?? UITableViewCell())
            
        } else if (cellType == .FirstImage || cellType == .SecondImage || cellType == .ThirdImage) {
            var cell = cellType.cell(tableView) as? ARImageHomeCell
            if (cell == nil) {
                cell = cellType.reuseCell() as? ARImageHomeCell
            }
            cell?.setupCell(cellType.image())
            return (cell ?? UITableViewCell())
            
        } else if (cellType == .Skaters) {
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellType = ARHomeCell.allValues()[indexPath.row]
        return cellType.heighCell()
    }
}

extension ARHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (ARSkateCreator.skaters?.count ?? 0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ARCellReuseIdentifier.HomeCells.SkaterCollectionCell.rawValue, forIndexPath: indexPath) as? ARSkaterCollectionCell
        cell?.setupCell(skater: ARSkateCreator.skaters?[indexPath.row])
        // Configure the cell
        return (cell ?? UICollectionViewCell())
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(ARSegues.OpenBiography.rawValue, sender: ARSkateCreator.skaters?[indexPath.row])
    }
}
