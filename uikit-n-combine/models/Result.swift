//
//  Result.swift
//  uikit-n-combine
//
//  Created by Bruno Rocha on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let artworkUrl100: String
    let screenshotUrls: [String]
    let averageUserRating: Float?
}
