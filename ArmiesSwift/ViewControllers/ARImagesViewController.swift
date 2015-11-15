//
//  ARImagesViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARImagesViewController            : ARViewController {
    
    var imageArray                      : [UIImage]? = []
    
    //MARK: - Outlets

    @IBOutlet weak var collectionView   : UICollectionView?
    
	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
		self.title = ARMenuOption.Images.titleMenu()
        self.createImageArray()
	}
    
    private func createImageArray() {
        let basicString = "InstagramArmies"
        for var i = 1; i < ARHarcodedConstants.NumberOfImagesInstagram; i++ {
            let imageName = basicString + String(i) + ".jpg"
            if let _image = UIImage(named: imageName) {
                self.imageArray?.append(_image)
            }
        }
        self.collectionView?.reloadData()
    }
	
	//MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == ARSegues.OpenImageViewer.rawValue) {
            let vc = segue.destinationViewController as? ARImageViewerViewController
            let armiesImage = sender as? UIImage
            vc?.armieImage = armiesImage
        }
    }

}

extension ARImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.imageArray?.count ?? 0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ARCellReuseIdentifier.ImageCells.ImageCell.rawValue, forIndexPath: indexPath) as? ARImageCell
        cell?.backgroundColor = UIColor.blackColor()
        cell?.instagramImageView?.image = self.imageArray?[indexPath.row]
        // Configure the cell
        return (cell ?? UICollectionViewCell())
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //get the width of the screen device
        let widthOfImage = (self.view.frame.width ?? 0) / ARHarcodedConstants.NumberOfImagesCollectionInstagram
        return CGSizeMake(widthOfImage, widthOfImage)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(ARSegues.OpenImageViewer.rawValue, sender: self.imageArray?[indexPath.row])
    }
}
