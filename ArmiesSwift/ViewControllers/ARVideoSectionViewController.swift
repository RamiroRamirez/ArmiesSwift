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
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ARVideoSectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Implementation UITAbleviewDataSource Implementation
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.videosId?.count ?? 0)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.SectionVideoCells.VideoCell.rawValue) as?  ARVideoCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ARCellReuseIdentifier.SectionVideoCells.VideoCell.rawValue) as? ARVideoCell
        }
        cell?.setupCell(self.videosId?[indexPath.row])
        // TODO: Remove this print when everything works correctly
//        print("Guardando \(cell?.videoYouTubeId) en index \(indexPath.row)")
        return (cell ?? UITableViewCell())
    }
    
    // MARK: - Implementation UITAbleviewDelegate Implementation
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ARCellHeightConstants.VideoCells.VideoCell.rawValue
    }
}
