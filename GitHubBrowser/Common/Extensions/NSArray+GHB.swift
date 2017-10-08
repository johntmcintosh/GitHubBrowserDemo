//
//  NSArray+GHB.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation


extension Array {
    
    func lengthLimited(to maxLength: Int?) -> Array {
        guard let limit = maxLength else {
            return self
        }
        
        let boundedLimit = Swift.min(self.count, limit)
        let maxIndex = boundedLimit - 1
        guard maxIndex >= 0 else {
            return []
        }
        
        let subarray = self[0...maxIndex]
        return Array(subarray)
    }
}
