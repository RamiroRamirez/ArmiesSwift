//
//  ARTwitterViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import STTwitter

class ARTwitterViewController   : UIViewController {
    
    var twitters                : [ARTwitter]? = []

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
        self.configurateTwitter()
	}
    
    private func configurateTwitter() {
        // intit twitter api
        let twitter = STTwitterAPI(appOnlyWithConsumerKey: ARTwitterKeys.consumerKey, consumerSecret: ARTwitterKeys.consumerSecret)
        // Verify credentials
        twitter.verifyCredentialsWithSuccessBlock({ (algo) -> Void in
            twitter.getUserTimelineWithScreenName(ARTwitterKeys.armiesScreenName, count: 20, successBlock: { (statuses) -> Void in
                self.fetchInfosFromTwitter(statuses as? [[String: AnyObject]])
                // the information was received from twitter endpoint
                // get the useful infos and displaz them in table view
                }, errorBlock: { (error) -> Void in
                    print(error)
            })
            }) { (error) -> Void in
                
        }
//        twitter.verifyCredentialsWithUserSuccessBlock({ (userName, userID) -> Void in
//            
//            twitter.getUserTimelineWithScreenName(ARTwitterKeys.armiesScreenName, count: 20, successBlock: { (statuses) -> Void in
//                self.fetchInfosFromTwitter(statuses as? [[String: AnyObject]])
//                // the information was received from twitter endpoint
//                // get the useful infos and displaz them in table view
//                }, errorBlock: { (error) -> Void in
//                    print(error)
//            })
//            }) { (error) -> Void in
//                print(error)
//        }
    }
    
    private func fetchInfosFromTwitter(twitterInfos: [[String: AnyObject]]?) {
        for dictionary in twitterInfos ?? [] {
            
            // fetch text to dislay
            let twitter = ARTwitter()
            twitter.text = dictionary["text"] as? String
            
            // fetch image to display
            let userDictionary = dictionary["user"] as? [String: AnyObject]
            twitter.urlImage = userDictionary?["profile_image_url"] as? String
            self.twitters?.append(twitter)
        }
    }
}
