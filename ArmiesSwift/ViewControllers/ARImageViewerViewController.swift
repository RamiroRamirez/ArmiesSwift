//
//  ARImageViewerViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 14/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARImageViewerViewController           : UIViewController {
    
    @IBOutlet weak var scrollImageView      : UIScrollView?
    @IBOutlet weak var imageView            : UIImageView?
    @IBOutlet weak var closeButton          : UIButton?
    
    var armieImage                          : UIImage?
    
    //MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfigurations()
    }
    
    //MARK: - Private methods
    
    private func initialConfigurations() {
        self.imageView?.image = self.armieImage
        
        self.closeButton?.layer.borderWidth = 2.0
        self.closeButton?.layer.borderColor = UIColor.whiteColor().CGColor
        self.closeButton?.layer.cornerRadius = 4.0
        self.closeButton?.clipsToBounds = true
        
        self.scrollImageView?.maximumZoomScale = 4.0
        self.scrollImageView?.minimumZoomScale = 1.0
        self.scrollImageView?.clipsToBounds = true
    }
    
    @IBAction func dismissViewPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ARImageViewerViewController: UIScrollViewDelegate {
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
