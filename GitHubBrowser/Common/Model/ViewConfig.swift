//
//  ViewConfig.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


/// Simple struct for passing configuration into view objects while allowing for dependency injection in unit tests.
struct ViewConfig {
    
    var timeZone: TimeZone
    var locale: Locale
}


extension ViewConfig {
    
    static func standard() -> ViewConfig {
        return ViewConfig(timeZone: .current, locale: .current)
    }
}
