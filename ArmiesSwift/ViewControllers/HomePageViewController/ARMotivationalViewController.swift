//
//  ARMotivationalViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 25/05/17.
//  Copyright © 2017 RAM. All rights reserved.
//

import UIKit

class ARMotivationalViewController              : ARCollectionViewController {
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createImageArray(withBasicString: "Motivacion")
    }
}
