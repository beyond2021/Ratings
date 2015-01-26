//
//  PlayersViewController.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/26/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players: [Player] = playersData //Here we add a player array property
    /*
    We could simply have set up the sample data in PlayersViewController when defining the players variable above. But because this data might later be provided from a plist or an SQL file, it’s wise to handle loading the data outside of the view controller.*/
    
    // MARK: - TableView DataCource Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            //The real work happens in here.
            let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
                as UITableViewCell
            
            let player = players[indexPath.row] as Player
            cell.textLabel.text = player.name
            cell.detailTextLabel?.text = player.game
            return cell
    }
    

}
