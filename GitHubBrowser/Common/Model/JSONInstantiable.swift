//
//  JSONInstantiable.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import Foundation
import SwiftyJSON


/// Conformers to this protocol are able to be instantiated from a JSON object.
protocol JSONInstantiable {
    
    init?(json: JSON)
}
