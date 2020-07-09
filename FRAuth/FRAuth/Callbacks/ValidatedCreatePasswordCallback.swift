//
//  ValidatedCreatePasswordCallback.swift
//  FRAuth
//
//  Copyright (c) 2019 ForgeRock. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//

import Foundation

/**
 ValidatedCreatePasswordCallback is a representation of OpenAM's ValidatedCreatePasswordCallback to collect single value of Password with OpenAM validation with given policies.
 */
@objc(FRValidatedCreatePasswordCallback)
public class ValidatedCreatePasswordCallback: AbstractValidatedCallback {
    
    /// Boolean indicator whether or not to display input value
    @objc public var echoOn: Bool = false
    
    //  MARK: - Init
    
    /// Designated initialization method for ValidatedCreatePasswordCallback
    ///
    /// - Parameter json: JSON object of ValidatedCreatePasswordCallback
    /// - Throws: AuthError.invalidCallbackResponse for invalid callback response
    required init(json: [String : Any]) throws {
        try super.init(json: json)
        
        guard let outputs = json["output"] as? [[String: Any]] else {
            throw AuthError.invalidCallbackResponse(String(describing: json))
        }
        
        for output in outputs {
            if let name = output["name"] as? String, name == "echoOn", let echoOn = output["value"] as? Bool {
                self.echoOn = echoOn
            }
        }
        self.echoOn = true
    }
}
