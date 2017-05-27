//
//  ARHomePageViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 22/05/17.
//  Copyright © 2017 RAM. All rights reserved.
//

import UIKit

class ARHomePageViewController: UIPageViewController {

    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController(viewControllerId: ARStoryboardIds.VideoIntroViewController.rawValue),
                self.newViewController(viewControllerId: ARStoryboardIds.MotivationalViewController.rawValue)]
    }()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfigurations()
        self.dataSource = self
        
        guard let firstViewController = self.orderedViewControllers.first else {
            return
        }
        
        self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    
    fileprivate func newViewController(viewControllerId: String) -> UIViewController {
        return UIStoryboard(name: ARStoryboardNames.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: viewControllerId)
    }
    
    fileprivate func initialConfigurations() {
        self.title = ARMenuOption.home.titleMenu()
    }
}

// MARK: - Actions

extension ARHomePageViewController {
    
    @IBAction private func twitterButtonPressed(_ sender: AnyObject) {
        self.slidingViewController().anchorTopViewToLeft(animated: true)
    }
    
    @IBAction private func menuButtonPressed(_ sender: AnyObject) {
        self.slidingViewController().anchorTopViewToRight(animated: true)
    }
}

// MARK: - Page View Controller Methods

extension ARHomePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = self.orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = (viewControllerIndex - 1)
        
        guard (previousIndex >= 0) else {
            return nil
        }
        
        guard (self.orderedViewControllers.count > previousIndex) else {
            return nil
        }
        
        return self.orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = self.orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = (viewControllerIndex + 1)
        let orderedViewControllersCount = self.orderedViewControllers.count
        
        guard (orderedViewControllersCount != nextIndex) else {
            return nil
        }
        
        guard (orderedViewControllersCount > nextIndex) else {
            return nil
        }
        
        return self.orderedViewControllers[nextIndex]
    }
}
