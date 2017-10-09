//
//  RepoCountFormatter.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


class RepoCountFormatter {
    
    let viewConfig: ViewConfig
    var legend: String
    
    init(legend: String, viewConfig: ViewConfig = .standard()) {
        self.legend = legend
        self.viewConfig = viewConfig
    }
    
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = self.viewConfig.locale
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    /// Return a view-formatted string for displaying the count of a metric
    func string(for count: Int) -> String? {
        guard let numericString = formatter.string(from: NSNumber(value: count)) else {
            return nil
        }
        return "\(numericString) \(legend)"
    }
}
