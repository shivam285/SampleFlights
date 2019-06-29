//
//  ValidationUtils.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/29/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import UIKit

public struct ValidationUtils {
    
    public static func show(error: Error, title: String, target: AnyObject, handler:(() -> Void)? = nil) {
        var errorMsg = "Something went wrong"
        if error.localizedDescription.count > 0 {
            errorMsg = error.localizedDescription
        }
        else {
            if error._code == 408 {
                errorMsg = "Check your network connection"
            }
        }
        let alert = UIAlertController(title: title, message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(_) in
            handler?()
        }))
        target.present(alert, animated: true, completion: nil)
    }
}
