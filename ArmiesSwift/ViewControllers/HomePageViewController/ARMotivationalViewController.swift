//
//  ARMotivationalViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 25/05/17.
//  Copyright © 2017 RAM. All rights reserved.
//

import UIKit

class ARMotivationalViewController              : UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var collectionView   : UICollectionView?
    
    // MARK: - Properties

    var imageArray                             : [UIImage]? = []
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createImageArray()
    }
    
    fileprivate func createImageArray() {
        let basicString = "Motivacion"
        for i in 1 ..< ARHarcodedConstants.NumberOfMotivationalImages {
            let imageName = basicString + String(i) + ".jpg"
            if let _image = UIImage(named: imageName) {
                self.imageArray?.append(_image)
            }
        }
        self.collectionView?.reloadData()
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == ARSegues.OpenImageViewer.rawValue) {
            let vc = segue.destination as? ARImageViewerViewController
            let armiesImage = sender as? UIImage
            vc?.armieImage = armiesImage
        }
    }
}

// MARK: - Collection View Methods

extension ARMotivationalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.imageArray?.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ARCellReuseIdentifier.ImageCells.ImageCell.rawValue, for: indexPath) as? ARImageCell
        cell?.setupCell(self.imageArray?[indexPath.row])
        // Configure the cell
        return (cell ?? UICollectionViewCell())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //get the width of the screen device
        let widthOfImage = (self.view.frame.width) / ARHarcodedConstants.NUmberOfImagesCollectionMotivation
        return CGSize(width: widthOfImage, height: widthOfImage)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: ARSegues.OpenImageViewer.rawValue, sender: self.imageArray?[indexPath.row])
    }

}
