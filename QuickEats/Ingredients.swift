//
//  Ingredients.swift
//  QuickEats
//
//  Created by Aakash Mehta on 14/5/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import Foundation

class Ingredients {

    var ingredient: String?
    var selected: Bool

    init(ingredient:String, selected:Bool) {
        self.ingredient = ingredient
        self.selected = selected
    }

    //load sample high scores
    static func loadSampleHighScores() -> [Ingredients] {
        let ing1 = Ingredients(ingredient: "Milk", selected: true)
        let ing2 = Ingredients(ingredient: "Bread", selected: false)
        return [ing1, ing2]
    }
}
