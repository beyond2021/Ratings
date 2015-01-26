//
//  Player.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/26/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//  create the main data model for the app – an array that contains Player objects
//  Player is simply a container object for these three properties: the name of the player, the game they’re playing, and a rating of 1 to 5 stars


import Foundation
import UIKit

class Player: NSObject {
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}