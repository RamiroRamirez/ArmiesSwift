//
//  ARVideoIntroViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 22/05/17.
//  Copyright © 2017 RAM. All rights reserved.
//

import UIKit
import AVFoundation

class ARVideoIntroViewController    : ARViewController {

    // MARK: - Properties

    private var player              : AVPlayer?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let videoURL = Bundle.main.url(forResource: "Italia", withExtension: "mov") else {
            return
        }
        
        self.player = AVPlayer(url: videoURL)
        self.player?.actionAtItemEnd = .none
        self.player?.isMuted = true

        let playerLayer = AVPlayerLayer(player: self.player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = self.view.frame
        
        self.view.layer.addSublayer(playerLayer)
        
        self.player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerPause(notification:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.continuePlaying(notification:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Player controller methods
    
    func playerPause(notification: NSNotification) {
        self.player?.pause()
    }
    
    func continuePlaying(notification: NSNotification) {
        self.player?.play()
    }
    func playerItemDidReachEnd(notification: NSNotification) {
        self.player?.seek(to: kCMTimeZero)
    }
}
