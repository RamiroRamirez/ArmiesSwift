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

	@IBOutlet private weak var videosTitleLabel		: UILabel?
    @IBOutlet private weak var firstVideoView       : YTPlayerView?
    @IBOutlet private weak var secondVideoView      : YTPlayerView?
    @IBOutlet private weak var thirdVideoView       : YTPlayerView?
    
	// MARK: - Public Methods

    func setupCell(skater skater: ARSkater?) {
        
		self.videosTitleLabel?.text = NSLocalizedString("BIOGRAPHY_VIDEOS", comment: "")
        self.firstVideoView?.loadWithVideoId(skater?.videos?.first)
        self.secondVideoView?.loadWithVideoId(skater?.videos?[1])
        self.thirdVideoView?.loadWithVideoId(skater?.videos?[2])
	}
}
