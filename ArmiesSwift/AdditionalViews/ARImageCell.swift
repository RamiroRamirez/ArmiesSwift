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
    
    @IBOutlet fileprivate weak var instagramImageView   : UIImageView?
    
    // MARK: - Configurate Methods
    
    func setupCell(_ image: UIImage?) {
        self.backgroundColor = UIColor.black
        self.instagramImageView?.image = image
    }
}
