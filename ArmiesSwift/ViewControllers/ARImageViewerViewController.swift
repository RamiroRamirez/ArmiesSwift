//
//  ARImageViewerViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 14/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class ARImageViewerViewController                   : UIViewController {
    
    @IBOutlet fileprivate weak var scrollImageView      : UIScrollView?
    @IBOutlet fileprivate weak var imageView            : UIImageView?
    @IBOutlet fileprivate weak var closeButton          : UIButton?
    
	fileprivate var centerImageView                     : CGPoint?
	fileprivate var distanceX                           : CGFloat = 0
	fileprivate var distanceY                           : CGFloat = 0
    var armieImage                                  : UIImage?
    
    //MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialConfigurations()
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		self.centerImageView = self.imageView?.center
	}
    
    //MARK: - General Helpers
    
    fileprivate func initialConfigurations() {
		self.imageView?.image = self.armieImage

		self.configurateCloseButton()
		self.configurateScrollView()
		self.configurateGestureRecognizer()
    }

    fileprivate func configurateCloseButton() {
        
        self.closeButton?.layer.borderWidth = ARHarcodedConstants.BorderWidthCloseButton
        self.closeButton?.layer.borderColor = UIColor.white.cgColor
        self.closeButton?.layer.cornerRadius = ARHarcodedConstants.CornerRadiusCloseButton
        self.closeButton?.clipsToBounds = true
        self.closeButton?.setTitle(NSLocalizedString("CLOSE_BUTTON", comment: ""), for: UIControlState())
    }
    
    fileprivate func configurateScrollView() {
        
        self.scrollImageView?.maximumZoomScale = ARHarcodedConstants.MaxZoomImageScrollView
        self.scrollImageView?.minimumZoomScale = ARHarcodedConstants.MinZommImageScrollView
        self.scrollImageView?.clipsToBounds = true
    }

	fileprivate func configurateGestureRecognizer() {
		let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ARImageViewerViewController.closePreviewIfNeeded(_:)))
		self.view.addGestureRecognizer(gestureRecognizer)
	}

	fileprivate func closeWithAnimation() {
        
		UIView.animate(withDuration: ARHarcodedConstants.StandardAnimation, animations: { [weak self] in
            self?.imageView?.alpha = 0.2
        }, completion: { [weak self] (succeeded: Bool) in
            self?.dismiss(animated: true, completion: nil)
		})
	}

	fileprivate func imageViewChangePositionAndAlpha(_ viewLocation: CGPoint) {
		UIView.animate(withDuration: ARHarcodedConstants.StandardAnimation, animations: {
			self.imageView?.center = CGPoint(x: viewLocation.x - self.distanceX, y: viewLocation.y - self.distanceY)
		}) 
	}

	func closePreviewIfNeeded(_ sender: UIPanGestureRecognizer)  {
		if (sender.state == .began) {
			self.distanceX = sender.location(in: self.view).x - (self.view.center.x ?? 0)
			self.distanceY = sender.location(in: self.view).y - (self.view.center.y ?? 0)
		}

		if (sender.state == UIGestureRecognizerState.changed) {
			self.imageViewChangePositionAndAlpha(sender.location(in: self.view))

		} else if (sender.state == .ended) {
            if (sender.location(in: self.view).y < self.view.center.y) {
                self.closeWithAnimation()
            } else {
                UIView.animate(withDuration: ARHarcodedConstants.StandardAnimation, animations: { [weak self] in
                    if let _view = self?.view {
                        self?.imageView?.center = (self?.centerImageView ?? _view.center)
                    }
                }) 
            }
		}
	}
    
    @IBAction func dismissViewPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ARImageViewerViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
