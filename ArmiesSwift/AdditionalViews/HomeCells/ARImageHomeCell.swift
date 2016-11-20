//
//  ARImageHomeCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 11/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARImageHomeCell                           : UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var armiesImageView  : UIImageView?
    
    // MARK: - Setup Methods
    
    func setupCell(armiesImage: UIImage?) {
        self.armiesImageView?.image = armiesImage
    }
}
