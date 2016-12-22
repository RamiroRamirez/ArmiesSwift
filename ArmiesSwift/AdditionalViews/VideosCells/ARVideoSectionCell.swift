//
//  ARVideoSectionCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARVideoSectionCell                                : UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var videoSectionImageView    : UIImageView?
    @IBOutlet fileprivate weak var titleVideoSectionLabel   : UILabel?
    
    // MARK: - Configurate Methods
    
    func setupCell(_ title: String?, image: UIImage?) {
        self.titleVideoSectionLabel?.text = title
        self.videoSectionImageView?.image = image
    }
}
