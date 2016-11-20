//
//  ARVideoCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ARVideoCell                           : UITableViewCell {
    
    
    // MARK: - Outlets

    @IBOutlet private weak var playerView   : YTPlayerView?
    
    // MARK: - Public Methods
    
    func setupCell(videoYouTubeId: String?) {
        if let videoId = videoYouTubeId {
            self.playerView?.loadWithVideoId(videoId)
        }
    }
}
