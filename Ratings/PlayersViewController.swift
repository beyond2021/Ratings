//
//  PlayersViewController.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/26/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit
import iAd

class PlayersViewController: UITableViewController {
    //Unwind segue from player detail
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    var players: [Player] = playersData //Here we add a player array property
    /*
    We could simply have set up the sample data in PlayersViewController when defining the players variable above. But because this data might later be provided from a plist or an SQL file, it’s wise to handle loading the data outside of the view controller.*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        self.title = "Players"
    }
    
    // MARK: - TableView DataCource Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
   
    
    // MARK: - Subtitle Cells
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            //The real work happens in here.
            //The method dequeueReusableCellWithIdentifier(_:forIndexPath:) will check to see if there is an existing cell that can be recycled. If not, it will automatically allocate a prototype cell and return it to you. All you need to do is supply the re-use identifier that you set on the prototype cell in the storyboard editor – in this case PlayerCell. Don’t forget to set that identifier, or this little scheme won’t work!
            
            let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
                as UITableViewCell
            
            let player = players[indexPath.row] as Player
            cell.textLabel.text = player.name
            cell.detailTextLabel?.text = player.game
            return cell
    }
*/
    // MARK: - Custom label in cells
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as UITableViewCell //1
        
        let player = players[indexPath.row] as Player //2
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel { //3
            nameLabel.text = player.name
        }
        if let gameLabel = cell.viewWithTag(101) as? UILabel {
            gameLabel.text = player.game
        }
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating(player.rating)
        }
        return cell
    }
*/
    // MARK: - Custom Cell Option
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
                as PlayerCell
            
            let player = players[indexPath.row] as Player
            cell.nameLabel1.text = player.name
            cell.gameLabel1.text = player.game
            cell.ratingImageView1.image = self.imageForRating(player.rating)
            return cell
    }
    
    /*
    Note: In this app you’re using only one prototype cell but if your table needs to display different kinds of cells then you can simply add additional prototype cells to the storyboard. You can either duplicate the existing cell to make a new one, or increment the value of the Table View’s Prototype Cells attribute. Be sure to give each cell its own re-use identifier, though.*/
    
    
    // MARK: - Image accessor method. Pretty simple – this returns a different star image depending on the rating.
        func imageForRating(rating:Int) -> UIImage? {
        switch rating {
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
    }

}
