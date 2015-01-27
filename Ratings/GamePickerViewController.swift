//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/27/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {
    
    var games:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Choose Game"
        games = ["Angry Birds",
            "Chess",
            "Russian Roulette",
            "Spin the Bottle",
            "Texas Hold'em Poker",
            "Tic-Tac-Toe"]
    }    
    //You just added a new String array called games and populated it with some hardcoded values in.
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = games[indexPath.row]
        return cell
    }
}
