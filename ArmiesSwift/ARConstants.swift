//
//  ARConstants.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import Foundation

enum ARStoryboardIds                                : String 	{
	
	case HomeViewController                         = "ARHomeViewController"
	case BiographiesViewController                  = "ARBiographiesListViewController"
	case VideosViewController                       = "ARVideosViewController"
	case ImagesViewController                       = "ARImagesViewController"
    case VideoIntroViewController                   = "ARVideoIntroViewController"
    case MotivationalViewController                 = "ARMotivationalViewController"
}

enum ARStoryboardNames                              : String    {
    
    case Main                                       = "Main"
}

enum ARSegues                                       : String	{

	case OpenBiography                              = "openBiography"
    case OpenVideoList                              = "openVideoList"
    case OpenImageViewer                            = "openImageViewer"
}

enum ARCellReuseIdentifier                                      {

	enum MenuCells                                  : String 	{

		case MenuCell                               = "ARMenuCellId"
	}

	enum BiographyCells                             : String 	{

		case ProfileImageCell                       = "ARProfileImageCell"
		case InfoCell                               = "ARInfoCell"
		case PhotosCell                             = "ARPhotosCell"
		case VideosCell                             = "ARVideosCell"
	}
    
    enum TwitterCells                               : String    {
        
        case TwitterCell                            = "ARTwitterCell"
    }

	enum SkaterCells                                : String 	{

		case SkaterCell                             = "ARSkaterCell"
	}
    
    enum ImageCells                                 : String    {
        
        case ImageCell                              = "ARImageCell"
    }
    
    enum SectionVideoCells                          : String    {
        
        case SectionVideoCell                       = "ARSectionVideoCell"
        case VideoCell                              = "ARVideoCell"
    }
    
    enum HomeCells                                  : String    {
        
        case TextCell                               = "ARTextHomeCell"
        case ImageCell                              = "ARImageHomeCell"
        case SkatersCell                            = "ARSkatersCell"
        case SkaterCollectionCell                   = "ARSkaterCollectionCell"
    }
}

enum ARCellHeightConstants {

	enum MenuCells                                  : CGFloat {

		case menuCell                               = 60
	}

	enum BiographyCells                             : CGFloat {

		case profileImageCell                       = 230
		case infoCell                               = 224
		case imagesCell                             = 400
		case videosCell                             = 1101
	}
    
	enum SkaterCells                                : CGFloat {

		case skaterCell                             = 70
	}
    
    enum VideoCells                                 : CGFloat {
        
        case titleCell                              = 70
        case videoCell                              = 350
    }
    
    enum TwitterCells                               : CGFloat {
        
        case twitterCellSmallDevice                 = 120
        case twitterCellBigDevice                   = 85
    }
    
    enum HomeCells                                  : CGFloat {
        
        case textCell                               = 100
        case imageCell                              = 250
        case skatersCell                            = 135
    }
}

struct ARHarcodedConstants {
	
	static let NumberOfImagesHomeView               : UInt      = 5
	static let NumberOfImagesBiography              : UInt      = 10
    static let NumberOfImagesCollectionInstagram    : CGFloat   = 3
    static let NUmberOfImagesCollectionMotivation   : CGFloat  = 2
    static let NumberOfImagesInstagram              : Int       = 23
    static let NumberOfMotivationalImages           : Int       = 31
    static let MaxZoomImageScrollView               : CGFloat   = 4
    static let MinZommImageScrollView               : CGFloat   = 1
    static let CornerRadiusCloseButton              : CGFloat   = 4
    static let BorderWidthCloseButton               : CGFloat   = 2
    static let StandardAnimation                    : TimeInterval = 0.3
}

struct ARTwitterKeys {
    
    static let ConsumerKey                          : String = "5i97w3KY8DpmMW9lfMmtj5iBx"
    static let ConsumerSecret                       : String = "cfOwwSLE3Zy9Oo2p7cQcX5tPdDit7ZvfTlsmYJFN5bh3RCKcSA"
    static let ArmiesScreenName                     : String = "Armiescompany"
    static let NumberOfTwitters                     : UInt   = 20
    
    struct JSonKey {
        static let TwitterText                      : String = "text"
        static let TwitterUser                      : String = "user"
        static let TwitterProfileImageURL           : String = "profile_image_url"
    }
}
