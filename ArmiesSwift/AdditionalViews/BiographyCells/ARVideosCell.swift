//
//  ARVideosCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ARVideosCell						: UITableViewCell {

	@IBOutlet var videosTitleLabel		: UILabel?
    @IBOutlet weak var firstVideoView   : YTPlayerView?
    @IBOutlet weak var secondVideoView  : YTPlayerView?
    @IBOutlet weak var thirdVideoView   : YTPlayerView?
    
    var skater                          : ARSkater?

	// MARK: - Public Methods

	func setCell() {
		self.videosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_VIDEOS", comment: "")
        self.firstVideoView?.loadWithVideoId(self.skater?.videos?.first)
        self.secondVideoView?.loadWithVideoId(self.skater?.videos?[1])
        self.thirdVideoView?.loadWithVideoId(self.skater?.videos?[2])
	}
}
