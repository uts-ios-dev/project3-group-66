//
//  Recipe.swift
//  QuickEats
//
//  Created by Aakash Mehta on 31/5/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import Foundation
import UIKit

//Recipe model
struct Recipe: Decodable {
    let id: Int?
    let image: String?
    let imageType: String?
    let likes: Int
    let missedIngredientCount: Int?
    let title: String?
    let usedIngredientCount: Int?
}

