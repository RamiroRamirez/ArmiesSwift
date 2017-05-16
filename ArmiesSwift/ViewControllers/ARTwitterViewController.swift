//
//  ARTwitterViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import STTwitter

class ARTwitterViewController               : UIViewController {
    
    var twitters                            : [ARTwitter]? = []
    var image                               : UIImage?
    
    // Oultlets
    
    @IBOutlet fileprivate weak var tableView    : UITableView?

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	fileprivate func initialConfigurations() {
        self.configurateTwitter(nil)
        self.configurateRefreshControl()
	}
    
    fileprivate func configurateTwitter(_ refreshControl: UIRefreshControl?) {
        // intit twitter api
        let twitter = STTwitterAPI(appOnlyWithConsumerKey: ARTwitterKeys.ConsumerKey, consumerSecret: ARTwitterKeys.ConsumerSecret)
        // Verify credentials
		twitter?.verifyCredentials(successBlock: { [weak self] (userName: String?) in
			twitter?.getUserTimeline(withScreenName: ARTwitterKeys.ArmiesScreenName, count: ARTwitterKeys.NumberOfTwitters, successBlock: { (statuses) in
				// reset twitters array
				self?.twitters?.removeAll()
				// the information was received from twitter endpoint
				// get the useful infos and display them in table view
				self?.fetchInfosFromTwitter(statuses as? [[String: AnyObject]])
				refreshControl?.endRefreshing()
				self?.tableView?.reloadData()

			}, errorBlock: { (error) in
				// TODO: Handle error
				print(error.debugDescription)
			})
		}, errorBlock: { (error) in
			print(error.debugDescription)
		})
	}
    
    fileprivate func configurateRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ARTwitterViewController.refresh(_:)), for: .valueChanged)
        self.tableView?.addSubview(refreshControl)
    }
    
    fileprivate func fetchInfosFromTwitter(_ twitterInfos: [[String: AnyObject]]?) {
        for dictionary in twitterInfos ?? [] {
            
            // fetch text to dislay
            let twitter = ARTwitter()
            twitter.text = dictionary[ARTwitterKeys.JSonKey.TwitterText] as? String
            
            // fetch image to display
            let userDictionary = dictionary[ARTwitterKeys.JSonKey.TwitterUser] as? [String: AnyObject]
            twitter.urlImage = userDictionary?[ARTwitterKeys.JSonKey.TwitterProfileImageURL] as? String
            self.twitters?.append(twitter)
        }
    }
    
    // MARK: - Public methods
    
    func refresh(_ refreshControl: UIRefreshControl) {
        // Do your job, when done:
        self.configurateTwitter(refreshControl)
        refreshControl.endRefreshing()
    }
}

extension ARTwitterViewController   : UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.twitters?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.image == nil),
            let _urlImage = self.twitters?[indexPath.row].urlImage,
            let _url = URL(string: _urlImage),
            let _imageData = try? Data(contentsOf: _url) {
                self.image = UIImage(data: _imageData)
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: ARCellReuseIdentifier.TwitterCells.TwitterCell.rawValue) as? ARTwitterCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ARCellReuseIdentifier.TwitterCells.TwitterCell.rawValue) as? ARTwitterCell
        }
        cell?.setupCell(self.twitters?[indexPath.row].text, image: self.image)
        return (cell ?? UITableViewCell())
    }
    
    //MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (UIDevice.isBigDevice() == true) {
            return ARCellHeightConstants.TwitterCells.twitterCellBigDevice.rawValue
        } else {
            return ARCellHeightConstants.TwitterCells.twitterCellSmallDevice.rawValue
        }
        
    }
    
}
