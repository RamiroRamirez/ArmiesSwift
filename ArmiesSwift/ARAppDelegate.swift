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

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		self.setAppearance()
        ARSkateCreator.createSkaters()
		return true
	}

	// MARK: - Appearance

	func setAppearance() {
		UINavigationBar.appearance().barTintColor = UIColor.defaultColor()
		UINavigationBar.appearance().tintColor = UIColor.white
		UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
		UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
	}
}

