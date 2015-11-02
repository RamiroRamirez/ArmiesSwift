//
//  ARSkater.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 04/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit

class ARSkater		: NSObject {

	var name			: String?
	var city			: String?
	var yearsOld		: String?
	var yearsSkating	: String?
	var profileImage	: String?

	func createSkater(name: String?, city: String?, yearsOld: String?, yearsSkating: String?) -> ARSkater? {
		let skater = ARSkater()
		skater.name = name
		skater.city = city
		skater.yearsOld = yearsOld
		skater.yearsSkating = yearsSkating
		return skater
	}
}
