//
//  RepoCountFormatter.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


struct RepoCountFormatter {
    
    var legend: String
    
    private static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    /// Return a view-formatted string for displaying the count of a metric
    func string(for count: Int) -> String? {
        guard let numericString = RepoCountFormatter.formatter.string(from: NSNumber(value: count)) else {
            return nil
        }
        return "\(numericString) \(legend)"
    }
}
