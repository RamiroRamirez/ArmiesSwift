//
//  ARImageCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 03/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARImageCell                                   : UICollectionViewCell {

    // MARK: - IBOultets
    
    @IBOutlet private weak var instagramImageView   : UIImageView?
    
    // MARK: - Configurate Methods
    
    func setupCell(image: UIImage?) {
        self.backgroundColor = UIColor.blackColor()
        self.instagramImageView?.image = image
    }
}
