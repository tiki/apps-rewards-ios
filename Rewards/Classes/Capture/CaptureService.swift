/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation


/// # CaptureService
///
/// The `CaptureService` class provides functionalities related to capturing and processing data, 
/// such as scanning physical and digital receipts and retrieving offers and contributors.
///
/// ## Example
///
/// To use the `CaptureService` class, follow the example below:
///
/// ```swift
/// let captureService = CaptureService()
///
/// // Trigger receipt scanning
/// captureService.scan()
///
/// // Retrieve offers for a specific account provider
/// let providerOffers = captureService.offers(provider: .yourProvider)
///
/// // Retrieve the largest contributors
/// let contributors = captureService.largestContributors()
public class CaptureService{
    // MARK: - Public Methods

    /// Initiates the receipt scanning process.
    ///
    /// Displays an alert indicating that the functionality is not implemented in the demo app.
    func scan() {
        let viewController = UIApplication.shared.windows.first?.rootViewController
        let message = "Receipt scanning functionality not implemented in demo app."
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController!.present(alertController, animated: true, completion: nil)
    }

    /// Retrieves a list of retailer offers for a specific account provider.
    ///
    /// - Parameter provider: The account provider for which offers should be retrieved.
    /// - Returns: An array of `RetailerOffer` objects containing offer details.
    func offers(provider: AccountProvider) -> [RetailerOffer] {
        return [
            RetailerOffer(provider: provider, description: "4% cashback on electronics", url: URL(string: "https://mytiki.com")!),
            RetailerOffer(provider: provider, description: "10% off on electronics", url: URL(string: "https://mytiki.com")!)
        ]
    }

    /// Retrieves a list of the largest contributors to the rewards program.
    ///
    /// - Returns: An array of `MoreContributor` objects containing contributor details.
    func largestContributors() -> [MoreContributor] {
        return [
            MoreContributor(name: "Walmart", percentage: 0.4),
            MoreContributor(name: "Kroger", percentage: 0.3),
            MoreContributor(name: "Dollar General", percentage: 0.2)
        ]
    }
}
