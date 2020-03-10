//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by ashish on 2/16/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBAction func retweet(_ sender: Any) {

                   TwitterAPICaller.client?.reTweet(tweetId: tweetId, success:{ self.setRetweeted(true)},
                                                          failure: {(error) in print("Retweet did not succeed:\(error)")})    }
    

    @IBOutlet weak var favButton: UIButton!
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success:{ self.setFavorite(true)},
                                                   failure: {(error) in print("Favorite did not succeed:\(error)")})
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setFavorite(false)},
                                                   failure: {(error) in print("Unfavorite did not succeed:\(error)")})
        }
    }
    
    
    func setFavorite(_ isFavorited:Bool){
        
        favorited = isFavorited
        
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
            
        }else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
