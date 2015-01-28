//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/27/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {
    //properties to hold the name and the index of the currently selected game
    var selectedGame:String? = nil
    var selectedGameIndex:Int? = nil
    //
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
        
        if let game = selectedGame {
            selectedGameIndex = find(games, game)!
        }
        //This takes the selectedGame you passed in from the PlayerDetailsViewController and translates it to an index that will be used to place a checkmark on that game. The find() will search the games array for a String matching selectedGame and will set the selectedGameIndex to the index where the match was found. You’ll use that index to set a checkmark in the table view cell
        
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
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = games[indexPath.row]
        return cell
    }
*/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //This sets a checkmark on the cell that contains the name of the currently selected game. Small gestures such as these will be appreciated by the users of the app.
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = games[indexPath.row]
        
        if indexPath.row == selectedGameIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedGameIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedGameIndex = indexPath.row
        selectedGame = games[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    //This method is needed because Unfortunately, the unwind segue method is performed before the tableView(_:didSelectRowAtIndexPath:) method, so that the selectedGameIndex is not updated in time. Fortunately, we can override prepareForSegue(_:sender:) and complete that operation before the unwind happens.
    //The sender parameter of prepareForSegue(_:sender:) is the object that initiated the segue, which in this case was the game cell that was selected. So you can use that cell’s indexPath to locate the selected game in the games array then set selectedGame so it is available in the unwind segue    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedGame" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedGameIndex = indexPath?.row
            if let index = selectedGameIndex {
                selectedGame = games[index]
            }
        }
    }
    
    
}
