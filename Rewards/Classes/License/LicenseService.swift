/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

public class LicenseService{
    
    var _isLicensed: Bool = false
    
    func isLicensed() -> Bool{
        return _isLicensed
    }
    
    func accept() {
        _isLicensed = true
    }

    func decline() {
        _isLicensed = false
    }

    func estimate() -> LicenseEstimate {
        return LicenseEstimate(min: 5, max: 15)
    }

    func earnings() -> LicenseEarnings {
        return LicenseEarnings(total: 34.30, rating: 4.8, bonus: 12.00)
    }

    func terms() -> String {
        return _terms
    }

    private let _terms = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ... (Your long terms and conditions string)"
      
}
