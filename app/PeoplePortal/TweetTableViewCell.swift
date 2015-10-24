//
//  TweetTableViewCell.swift
//  PeoplePortal
//
//  Created by Anastasis Germanidis on 10/19/15.
//  Copyright © 2015 Anastasis Germanidis. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetContentView: UITextView!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var retweetIndicator: UIImageView!
    @IBOutlet weak var retweeterProfileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 5.0
        retweeterProfileImageView.layer.cornerRadius = 5.0
        layoutMargins = UIEdgeInsetsZero
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func loadWithTweet(tweet: Tweet) {
        var originalTweet: Tweet?
        if tweet.isRetweet() {
            originalTweet = tweet.retweetedStatus!
        } else {
            originalTweet = tweet
        }
        
        nameLabel.text = originalTweet!.user?.name
        screenNameLabel.text = "@\(originalTweet!.user!.screenName!)"
        timeAgoLabel.text = originalTweet!.ctime?.shortTimeAgoSinceNow()
        tweetContentView.text = originalTweet!.text
        favoriteCountLabel.text = Utils.formatNumber(originalTweet!.favoriteCount!)
        retweetCountLabel.text = Utils.formatNumber(originalTweet!.retweetCount!)
        
        retweetIndicator.hidden = !tweet.isRetweet()
        retweeterProfileImageView.hidden = !tweet.isRetweet()
        
        if tweet.isRetweet() {
            retweeterProfileImageView.sd_setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!))
            profileImageView.sd_setImageWithURL(NSURL(string: tweet.retweetedStatus!.user!.profileImageUrl!))
            
        } else {
            profileImageView.sd_setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!))
        }
        
    }

}