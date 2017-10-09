//
//  ViewConfig+Tests.swift
//  GitHubBrowserTests
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

@testable import GitHubBrowser
import Foundation


extension ViewConfig {
    
    /// Instance of ViewConfig that's standardized for consistency across screenshot tests.
    static func mock() -> ViewConfig {
        return ViewConfig(
            animated: false,
            timeZone: TimeZone(abbreviation: "CDT")!,
            locale: Locale(identifier: "en_US"))
    }
}
