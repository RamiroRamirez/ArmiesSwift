//
//  ARVideosViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

enum ARVideoSection : Int {
    
    case bestTricks = 0
    case trickTips
    case translation
    case film
    
    static func allValues() -> [ARVideoSection] {
        return [.bestTricks, .trickTips, .translation, .film]
    }
    
    func title() -> String? {
        switch(self) {
        case .bestTricks:       return NSLocalizedString("VIDEOS_BEST_TRICKS_TITLE", comment: "")
        case .trickTips:        return NSLocalizedString("VIDEOS_TRICK_TIPS_TITLE", comment: "")
        case .translation:      return NSLocalizedString("VIDEOS_TRADUCTIONS_TITLE", comment: "")
        case .film:             return NSLocalizedString("VIDEOS_FILM_TITLE", comment: "")
        }
    }
    
    func iconImage() -> String {
        switch(self) {
        case .bestTricks:       return "ic_best_trick.png"
        case .trickTips:        return "ic_trick_tip.png"
        case .translation:      return "ic_traducciones.png"
        case .film:             return "ic_la_pelicula.png"
        }

    }
    
    func videosId() -> [String]? {
        switch(self) {
        case .bestTricks:       return ["FR2tKIzevQQ", "4eblKX2YP40", "OsoaGtFv900", "D63n2j-luUg", "b6NyHHpKC7Q", "Ok9CdVAJlR8"]
        case .trickTips:        return ["ihCQlSWKLO8", "FJhckrzEU9E", "xG2zVK2v27o", "i5tU4G4chyU", "8h-NZKNFpAE"]
        case .translation:      return ["npbeIKKrwTw", "SAee0qVFUVw"]
        case .film:             return ["NUwcxvGgrM8", "Px6zDq_QVnU", "YSVFKERHXfg", "YAZ3kbQKZ2E", "69aoA9M332U", "gHrA_wJ6sfA", "_ibBxapPKv4"]
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

	fileprivate func initialConfigurations() {
		self.title = ARMenuOption.videos.titleMenu()
	}
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == ARSegues.OpenVideoList.rawValue),
            let _indexPath = sender as? IndexPath {
                let vc = segue.destination as? ARVideoSectionViewController
                vc?.videoSection = ARVideoSection.allValues()[_indexPath.row]
                vc?.videosId = ARVideoSection.allValues()[_indexPath.row].videosId()
        }
    }
}

extension ARVideosViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARVideoSection.allValues().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.SectionVideoCells.SectionVideoCell.rawValue) as?  ARVideoSectionCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: ARCellReuseIdentifier.SectionVideoCells.SectionVideoCell.rawValue) as? ARVideoSectionCell
        }
        cell?.setupCell(ARVideoSection.allValues()[indexPath.row].title(), image: UIImage(named: ARVideoSection.allValues()[indexPath.row].iconImage()))
        return (cell ?? UITableViewCell())
    }
    
    //MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: ARSegues.OpenVideoList.rawValue, sender: indexPath)
    }
}
