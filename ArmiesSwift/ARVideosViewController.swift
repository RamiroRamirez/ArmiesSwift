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
        case .BestTricks:       return NSLocalizedString("VIDEOS_BEST_TRICKS_TITLE", comment: "")
        case .TrickTips:        return NSLocalizedString("VIDEOS_TRICK_TIPS_TITLE", comment: "")
        case .Translation:      return NSLocalizedString("VIDEOS_TRADUCTIONS_TITLE", comment: "")
        case .Film:             return NSLocalizedString("VIDEOS_FILM_TITLE", comment: "")
        }
    }
    
    func iconImage() -> String {
        switch(self) {
        case .BestTricks:       return "ic_best_trick.png"
        case .TrickTips:        return "ic_trick_tip.png"
        case .Translation:      return "ic_traducciones.png"
        case .Film:             return "ic_la_pelicula.png"
        }

    }
    
    func videosId() -> [String]? {
        switch(self) {
        case .BestTricks:       return ["FR2tKIzevQQ", "4eblKX2YP40", "OsoaGtFv900", "D63n2j-luUg", "b6NyHHpKC7Q", "Ok9CdVAJlR8"]
        case .TrickTips:        return ["ihCQlSWKLO8", "FJhckrzEU9E", "xG2zVK2v27o", "i5tU4G4chyU", "8h-NZKNFpAE"]
        case .Translation:      return ["npbeIKKrwTw", "SAee0qVFUVw"]
        case .Film:             return ["NUwcxvGgrM8", "Px6zDq_QVnU", "YSVFKERHXfg", "YAZ3kbQKZ2E", "69aoA9M332U", "gHrA_wJ6sfA", "_ibBxapPKv4"]
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
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == ARSegues.OpenVideoList.rawValue),
            let _indexPath = sender as? NSIndexPath {
                let vc = segue.destinationViewController as? ARVideoSectionViewController
                vc?.videoSection = ARVideoSection.allValues()[_indexPath.row]
                vc?.videosId = ARVideoSection.allValues()[_indexPath.row].videosId()
        }
    }
}

extension ARVideosViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARVideoSection.allValues().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.SectionVideoCells.SectionVideoCell.rawValue) as?  ARVideoSectionCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ARCellReuseIdentifier.SectionVideoCells.SectionVideoCell.rawValue) as? ARVideoSectionCell
        }
        cell?.setupCell(ARVideoSection.allValues()[indexPath.row].title(), image: UIImage(named: ARVideoSection.allValues()[indexPath.row].iconImage()))
        return (cell ?? UITableViewCell())
    }
    
    //MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(ARSegues.OpenVideoList.rawValue, sender: indexPath)
    }
}
