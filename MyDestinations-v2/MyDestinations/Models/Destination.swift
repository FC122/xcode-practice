//
//  Destination.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

class Destination: Codable {
    
    // MARK: - Static variables
    static let userDefaultsKey = "DestinationKey"

    // MARK: - Variables
    let id: String
    var title: String
    var description: String
    var langitude: String
    var longitude: String
    var url: String
    
    // MARK: - Init
    init(title: String, description: String, langitude:String, longitude:String, url:String) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.langitude = langitude
        self.longitude = longitude
        self.url = url
    }
    
}
