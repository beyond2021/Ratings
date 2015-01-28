//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/27/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//  
/*
Storyboards provide the ability to ‘go back’ with something called an unwind segue, which you’ll implement next. There are three main steps:

Create an object for the user to select, usually a button.
Create an unwind method in the controller that you want to return to.
Hook up the method and the object in the storyboard.

*/

/*
With a grouped table view  you don’t have to create a data source for this table. You can design it directly in Interface Builder — no need to write cellForRowAtIndexPath for this one. The feature that makes this possible is called static cells.
placeholder code for the data source and that will prevent the static cells from working properly.
One more thing about static cells: they only work in UITableViewController. Even though Interface Builder will let you add them to a Table View object inside a regular UIViewController, this won’t work during runtime. The reason for this is that UITableViewController provides some extra magic to take care of the data source for the static cells. Xcode even prevents you from compiling such a project with the error message: “Illegal Configuration: Static table views are only valid when embedded in UITableViewController instances”.

Prototype cells, on the other hand, work just fine in a table view that you place inside a regular view controller. Neither work for nibs, though. At the moment, if you want to use prototype cells or static cells, you’ll have to use a storyboard.

It is not unthinkable that you might want to have a single table view that combines both static cells and regular dynamic cells, but this isn’t very well supported by the SDK. If this is something you need to do in your own app, then see this post on the Apple Developer Forums for a possible solution.
*/

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var game:String = "Chess" // a property to hold the selected game so that you can store it in the Player object later. Give it a default of “Chess” so you always have a game selected for new players.
    
    @IBOutlet weak var nameTextField: UITextField! // Do not do this with prototype cells.
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var player:Player! //This does not instantiate the property but the exclamation mark, defining it as an implicitly unwrapped optional, means that it must be instantiated and have a value before using it.
    
    // Unwind Segue Method.
    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        // This code will get executed once the user selects a game from the Choose Game Scene. This method updates both the label on screen and the game property based on the game selected. It also pops the GamePickerViewController off the navigation controller’s stack. Now hook up the cell in the GamePicker.
        
        let gamePickerViewController = segue.sourceViewController as GamePickerViewController
        if let selectedGame = gamePickerViewController.selectedGame {
            detailLabel.text = selectedGame
            game = selectedGame
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
   //Memopry checkers
    required init(coder aDecoder: NSCoder) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = game // Display chess
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //This method ensures that the tableView brings up the keyboard whenever you tapp anywhere in the cell. There is only one cell in the section so you only need to test for the section index. Making the text field the first responder will automatically bring up the keyboard.
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            //The prepareForSegue(_:sender:) method creates a new Player instance with default values for game and rating. It does this only for a segue that has the identifier of SavePlayerDetail.
            player = Player(name: self.nameTextField.text, game: "Chess", rating: 1)
        }
    }
*/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //the unwind segue going back to the Players list
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text, game:game, rating: 1)
        }
        if segue.identifier == "PickGame" {
            //the push segue going forwards to the Game Picker screen.
            let gamePickerViewController = segue.destinationViewController as GamePickerViewController
            gamePickerViewController.selectedGame = game
        }
    }
    
   
}
