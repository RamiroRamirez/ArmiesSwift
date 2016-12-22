//
//  ARVideosCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ARVideosCell                                  : UITableViewCell {
    
    // MARK: - IBOutlets

	@IBOutlet fileprivate weak var videosTitleLabel		: UILabel?
    @IBOutlet fileprivate weak var firstVideoView       : YTPlayerView?
    @IBOutlet fileprivate weak var secondVideoView      : YTPlayerView?
    @IBOutlet fileprivate weak var thirdVideoView       : YTPlayerView?
    
	// MARK: - Public Methods

    func setupCell(skater: ARSkater?) {
        
		self.videosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_VIDEOS", comment: "")
		if
			let firstVideo = skater?.videos?.first,
			let secondVideo = skater?.videos?[1],
			let thirdVideo = skater?.videos?[2] {
				self.firstVideoView?.load(withVideoId: firstVideo)
				self.secondVideoView?.load(withVideoId: secondVideo)
				self.thirdVideoView?.load(withVideoId: thirdVideo)
		}
	}
}
