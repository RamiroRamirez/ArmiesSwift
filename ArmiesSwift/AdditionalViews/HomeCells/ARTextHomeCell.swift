//
//  ARTextHomeCell.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 11/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARTextHomeCell                                : UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet private weak var armiesTextLabel      : UILabel?
    
    // MARK: - Configurate Methods
    
    func setupCell(text: String?) {
        self.armiesTextLabel?.text = text
    }
}
