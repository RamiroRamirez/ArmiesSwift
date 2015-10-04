//
//  ARConstants.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import Foundation

enum ARStoryboardIds	                 	: String 	{
	
	case HomeViewController              	= "ARHomeViewController"
	case BiographiesViewController 	   		= "ARBiographiesListViewController"
	case VideosViewController      	 		= "ARVideosViewController"
	case ImagesViewController          	 	= "ARImagesViewController"
	case InstagramViewController       		= "ARInstagramViewController"
	case SettingsViewController				= "ARSettingsViewController"
}

enum ARSegues								: String	{

	case OpenBiography						= "openBiography"
}

enum ARCellReuseIdentifier				 				{

	enum MenuCells							: String 	{

		case MenuCell						= "ARMenuCellId"
	}

	enum BiographyCells						: String 	{

		case ProfileImageCell				= "ARProfileImageCell"
		case InfoCell						= "ARInfoCell"
		case PhotosCell						= "ARPhotosCell"
		case VideosCell						= "ARVideosCell"
	}

	enum SkaterCells						: String 	{

		case SkaterCell						= "ARSkaterCell"
	}
}

enum ARCellHeightConstants {

	enum MenuCells 							: CGFloat {

		case MenuCell						= 60
	}

	enum BiographyCells						: CGFloat {

		case ProfileImageCell				= 230
		case InfoCell						= 224
		case ImagesCell						= 400
		case VideosCell						= 253
	}
	enum SkaterCells						: CGFloat {

		case SkaterCell						= 90
	}
}

struct ARHarcodedConstants {
	
	static let numberOfImagesHomeView		: UInt	= 5
	static let numberOfImagesBiography		: UInt = 10
}