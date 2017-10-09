//
//  UIViewController+GHB.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/8/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func clearBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem()
    }

    func presentOkAlert(message: String, completion: (() -> ())? = nil) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok confirmation"), style: .cancel, handler: nil))
        present(alert, animated: true, completion: completion)
    }
}
