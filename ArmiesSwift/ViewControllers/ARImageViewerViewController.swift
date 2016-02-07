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
	var centerImageView						: CGPoint?

	var distanceX							: CGFloat = 0
	var distanceY							: CGFloat = 0
    
    //MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfigurations()
    }

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		self.centerImageView = self.imageView?.center
	}
    
    //MARK: - Private methods
    
    private func initialConfigurations() {
        self.imageView?.image = self.armieImage
        
        self.configurateCloseButton()
        self.configurateScrollView()
		self.configurateGestureRecognizer()
    }
    
    private func configurateCloseButton() {
        
        self.closeButton?.layer.borderWidth = ARHarcodedConstants.BorderWidthCloseButton
        self.closeButton?.layer.borderColor = UIColor.whiteColor().CGColor
        self.closeButton?.layer.cornerRadius = ARHarcodedConstants.CornerRadiusCloseButton
        self.closeButton?.clipsToBounds = true
        self.closeButton?.setTitle(NSLocalizedString("CLOSE_BUTTON", comment: ""), forState: .Normal)
    }
    
    private func configurateScrollView() {
        
        self.scrollImageView?.maximumZoomScale = ARHarcodedConstants.MaxZoomImageScrollView
        self.scrollImageView?.minimumZoomScale = ARHarcodedConstants.MinZommImageScrollView
        self.scrollImageView?.clipsToBounds = true
    }

	private func configurateGestureRecognizer() {
		let gestureRecognizer = UIPanGestureRecognizer(target: self, action: "hazAlgo:")
		self.view.addGestureRecognizer(gestureRecognizer)
	}

	private func closeWithAnimation() {
		UIView.animateWithDuration(0.3, animations: {

				self.imageView?.alpha = 0.2
			}) { (succeeded: Bool) in
				self.dismissViewControllerAnimated(true, completion: nil)
		}
	}

	private func imageViewChangePositionAndAlpha(viewLocation: CGPoint) {
		UIView.animateWithDuration(0.3) {
			self.imageView?.center = CGPointMake(viewLocation.x - self.distanceX, viewLocation.y - self.distanceY)
		}
	}

	func hazAlgo(sender: UIPanGestureRecognizer)  {
		if (sender.state == .Began) {
			print("CENTRO: X:\(self.imageView?.center.x)   Y:\(self.imageView?.center.y)")
			print("-------------")
			print("DISTANCIA EN X: \(sender.locationInView(self.view).x - self.view.center.x)")
			print("DISTANCIA EN Y: \(sender.locationInView(self.view).y - self.view.center.y)")
//			self.distanceX = sender.locationInView(self.view).x - (self.imageView?.center.x ?? 0)
//			self.distanceY = sender.locationInView(self.view).y - (self.imageView?.center.y ?? 0)
			self.distanceX = sender.locationInView(self.view).x - (self.view.center.x ?? 0)
			self.distanceY = sender.locationInView(self.view).y - (self.view.center.y ?? 0)
		}

		if (sender.state == UIGestureRecognizerState.Changed) {
			self.imageViewChangePositionAndAlpha(sender.locationInView(self.view))
		} else {
			if (sender.state == .Ended) {
				if (sender.locationInView(self.view).y < self.view.center.y) {
					self.closeWithAnimation()
				} else {
					UIView.animateWithDuration(0.3) {
						self.imageView?.center = (self.centerImageView ?? self.view.center)
					}
				}
			}
		}
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
