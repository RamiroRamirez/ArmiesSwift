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

	fileprivate func initialConfigurations() {
		self.title = ARMenuOption.biographies.titleMenu()
	}
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == ARSegues.OpenBiography.rawValue) {
            let sender = sender as? ARSkater
            let vc = segue.destination as? ARBiographyViewController
            vc?.skater = sender
        }
    }
}

extension ARListBiographiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ARSkateCreator.skaters?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.SkaterCells.SkaterCell.rawValue) as? ARSkaterCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: ARCellReuseIdentifier.SkaterCells.SkaterCell.rawValue) as? ARSkaterCell
        }
        cell?.setupCell(skater: ARSkateCreator.skaters?[indexPath.row])
        return (cell ?? UITableViewCell())
    }
    
    // MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: ARSegues.OpenBiography.rawValue, sender: ARSkateCreator.skaters?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ARCellHeightConstants.SkaterCells.skaterCell.rawValue
    }
}
