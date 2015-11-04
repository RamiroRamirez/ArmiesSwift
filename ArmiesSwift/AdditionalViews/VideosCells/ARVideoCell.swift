//
//  ARVideoCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ARVideoCell                   : UITableViewCell {
    
    var videoYouTubeId              : String?
    
    // MARK: - Outlets

    @IBOutlet weak var playerView   : YTPlayerView?
    
    // MARK: - Public Methods
    
    func setCell() {
        if let videoId = self.videoYouTubeId {
            self.playerView?.loadWithVideoId(videoId)
        }
    }
}
