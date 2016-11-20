//
//  ARTwitterCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 02/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARTwitterCell                                 : UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var armieImageView       : UIImageView?
    @IBOutlet private weak var twitterTextField     : UITextView?
    
    // MARK: - Cell Configuration Methods
    
    func setupCell(twitterText: String?, image: UIImage?) {
        self.twitterTextField?.text = twitterText
        self.armieImageView?.image = image
    }
    
}
