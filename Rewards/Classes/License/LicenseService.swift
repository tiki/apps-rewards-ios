/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

/// # LicenseService
///
/// The `LicenseService` class manages licensing-related functionalities using TIKI infrastructure, 
/// including license status, acceptance, decline, and providing license-related information.
///
/// ## Example
///
/// To use the `LicenseService` class, follow the example below:
///
/// ```swift
/// let licenseService = LicenseService()
///
/// // Check if there is a valid license for the user data.
/// let isLicensed = licenseService.isLicensed()
///
/// // Accept the license agreement.
/// licenseService.accept()
///
/// // Decline the license agreement.
/// licenseService.decline()
///
/// // Retrieve an estimate of the license returns for the user.
/// let licenseEstimate = licenseService.estimate()
///
/// // Retrieve earnings information related to the license.
/// let licenseEarnings = licenseService.earnings()
///
/// // Retrieve the terms and conditions.
/// let termsAndConditions = licenseService.terms()
public class LicenseService{
    // MARK: - Properties

    /// The current license status.
    var _isLicensed: Bool = false

    // MARK: - Public Methods

    /// Retrieves the current license status.
    ///
    /// - Returns: `true` if the app is licensed, `false` otherwise.
    func isLicensed() -> Bool {
        return _isLicensed
    }

    /// Accepts the data license agreement.
    func accept() {
        _isLicensed = true
    }

    /// Declines the data license agreement.
    func decline() {
        _isLicensed = false
    }

    /// Retrieves an estimate of the license duration.
    ///
    /// - Returns: A `LicenseEstimate` object containing the minimum and maximum duration.
    func estimate() -> LicenseEstimate {
        return LicenseEstimate(min: 5, max: 15)
    }

    /// Retrieves earnings information related to the license.
    ///
    /// - Returns: A `LicenseEarnings` object containing total earnings, rating, and bonus.
    func earnings() -> LicenseEarnings {
        return LicenseEarnings(total: 34.30, rating: 4.8, bonus: 12.00)
    }

    /// Retrieves the terms and conditions associated with the license.
    ///
    /// - Returns: A string containing the terms and conditions.
    ///
    /// - Note: Replace the placeholder string with your actual terms and conditions.
    func terms() -> String {
        return _terms
    }

    // MARK: - Private Properties

    /// The terms and conditions associated with the license.
    private let _terms = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ... (Your long terms and conditions string)"
}
