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

    @IBOutlet fileprivate weak var playerView   : YTPlayerView?
    
    // MARK: - Public Methods
    
    func setupCell(_ videoYouTubeId: String?) {
        if let videoId = videoYouTubeId {
            self.playerView?.load(withVideoId: videoId)
        }
    }
}
