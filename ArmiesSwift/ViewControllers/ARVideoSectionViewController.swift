//
//  ARVideoSectionViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARVideoSectionViewController  : UIViewController {
    
    var videosId                    : [String]? = []
    var videoSection                : ARVideoSection?
}

extension ARVideoSectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Implementation UITAbleviewDataSource Implementation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.videosId?.count ?? 0)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.SectionVideoCells.VideoCell.rawValue) as?  ARVideoCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: ARCellReuseIdentifier.SectionVideoCells.VideoCell.rawValue) as? ARVideoCell
        }
        cell?.setupCell(self.videosId?[indexPath.row])
        // TODO: Remove this print when everything works correctly
//        print("Guardando \(cell?.videoYouTubeId) en index \(indexPath.row)")
        return (cell ?? UITableViewCell())
    }
    
    // MARK: - Implementation UITAbleviewDelegate Implementation
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ARCellHeightConstants.VideoCells.videoCell.rawValue
    }
}
