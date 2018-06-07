//
//  Recipe.swift
//  QuickEats
//
//  Created by Aakash Mehta on 31/5/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import Foundation

struct Recipe: Decodable {
    let title: String
    let homepageURL: URL
    let articles: [Article]
    
    enum CodingKeys : String, CodingKey {
        case title
        case homepageURL = "home_page_url"
        case articles = "items"
    }
}

struct Article: Decodable {
    let id: String
    let url: URL
    let title: String
}
