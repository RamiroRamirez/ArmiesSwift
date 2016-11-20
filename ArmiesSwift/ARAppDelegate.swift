//
//  ARAppDelegate.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

@UIApplicationMain
class ARAppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		self.setAppearance()
        ARSkateCreator.createSkaters()
		return true
	}

	// MARK: - Appearance

	func setAppearance() {
		UINavigationBar.appearance().barTintColor = UIColor.defaultColor()
		UINavigationBar.appearance().tintColor = UIColor.whiteColor()
		UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
	}
}

