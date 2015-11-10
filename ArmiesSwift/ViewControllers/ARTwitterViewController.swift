//
//  ARTwitterViewController.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 12/09/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import UIKit
import STTwitter

class ARTwitterViewController       : UIViewController {
    
    var twitters                    : [ARTwitter]? = []
    var image                       : UIImage?
    
    // Oultlets
    
    @IBOutlet weak var tableView    : UITableView?

	//MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initialConfigurations()
	}

	//MARK: - Private Methods

	private func initialConfigurations() {
        self.configurateTwitter(nil)
       
	}
    
    private func configurateRefreshElement() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        self.tableView?.addSubview(refreshControl)
    }
    
    private func configurateTwitter(refreshControl: UIRefreshControl?) {
        // intit twitter api
        let twitter = STTwitterAPI(appOnlyWithConsumerKey: ARTwitterKeys.consumerKey, consumerSecret: ARTwitterKeys.consumerSecret)
        // Verify credentials
        twitter.verifyCredentialsWithSuccessBlock({ (bearerToken) -> Void in
            twitter.getUserTimelineWithScreenName(ARTwitterKeys.armiesScreenName, count: 20, successBlock: { (statuses) in
                // reset twitters array
                self.twitters?.removeAll()
                // the information was received from twitter endpoint
                // get the useful infos and display them in table view
                self.fetchInfosFromTwitter(statuses as? [[String: AnyObject]])
                refreshControl?.endRefreshing()
                self.tableView?.reloadData()
                
                }, errorBlock: { (error) in
                    // TODO: Handle error
                    print(error)
            })
            }) { (error) in
                // TODO: Handle error
                
        }
    }
    
    private func configurateRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        self.tableView?.addSubview(refreshControl)
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
    
    private func refresh(refreshControl: UIRefreshControl) {
        // Do your job, when done:
        self.configurateTwitter(refreshControl)
        refreshControl.endRefreshing()
    }
}

extension ARTwitterViewController   : UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Implementation UITableViewDataSource Protocol
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.twitters?.count ?? 0)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (self.image == nil),
            let _urlImage = self.twitters?[indexPath.row].urlImage,
            let _url = NSURL(string: _urlImage),
            let _imageData = NSData(contentsOfURL: _url) {
                self.image = UIImage(data: _imageData)
        }
        var cell = tableView.dequeueReusableCellWithIdentifier(ARCellReuseIdentifier.TwitterCells.TwitterCell.rawValue) as? ARTwitterCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ARCellReuseIdentifier.TwitterCells.TwitterCell.rawValue) as? ARTwitterCell
        }
        cell?.twitterTextField?.text = self.twitters?[indexPath.row].text
        cell?.armieImageView?.image = self.image
        return (cell ?? UITableViewCell())
    }
    
    //MARK: - Implementation UITableViewDelegate Protocol
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
}
