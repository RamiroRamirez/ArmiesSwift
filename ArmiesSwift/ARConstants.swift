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
    case OpenVideoList                      = "openVideoList"
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
    
    enum TwitterCells                       : String    {
        
        case TwitterCell                    = "ARTwitterCell"
    }

	enum SkaterCells						: String 	{

		case SkaterCell						= "ARSkaterCell"
	}
    
    enum ImageCells                         : String    {
        
        case ImageCell                      = "ARImageCell"
    }
    
    enum SectionVideoCells                  : String    {
        
        case SectionVideoCell               = "ARSectionVideoCell"
        case TitleSectionVideoCell          = "ARTitleSectionVideoCell"
        case VideoCell                      = "ARVideoCell"
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
		case VideosCell						= 401
	}
    
	enum SkaterCells						: CGFloat {

		case SkaterCell						= 70
	}
    
    enum VideoCells                         : CGFloat {
        
        case TitleCell                      = 70
        case VideoCell                      = 350
    }
}

struct ARHarcodedConstants {
	
	static let numberOfImagesHomeView		: UInt	= 5
	static let numberOfImagesBiography		: UInt  = 10
    static let numberOfImagesCollectionInstagram    : CGFloat  = 3
    static let numberOfImagesInstagram      : Int   = 23
}

struct ARTwitterKeys {
    
    static let consumerKey                  : String = "5i97w3KY8DpmMW9lfMmtj5iBx"
    static let consumerSecret               : String = "cfOwwSLE3Zy9Oo2p7cQcX5tPdDit7ZvfTlsmYJFN5bh3RCKcSA"
    static let armiesScreenName             : String = "Armiescompany"
    static let numberOfTwitters             : Int    = 20   
}