/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI
import CaptureReceipt
import TikiSdk

/// # Rewards
///
/// The `Rewards` class is the main API to interact with TIKI Rewards program.
///
/// ## Overview
///
/// The Rewards class works as a singleton and initializes the services for:
/// - theming: `Theme` 
/// - 3rd party account management: `AccountService`
/// - capture user data: `CaptureService`
/// - data license handling: `LicenseService`
///
/// ## Example
///
/// To get started with the rewards system, use the following example:
///
/// ```swift
/// // Start rewards system with default theme
/// Rewards.start()
///
/// // Start rewards system with a custom theme
/// ```
///   Rewards.start(Theme(
///     primaryTextColor: <Color>,
///     secondaryTextColor: <Color>,
///     primaryBackgroundColor: <Color>,
///     secondaryBackgroundColor: <Color>,
///     accentColor: <Color>,
///     fontFamily: <Font Family>))
/// ```
///
public class Rewards{
    
    /// The current theme.
    public static var theme: Theme = Theme()
    
    /// An instance of `AccountService` for managing 3rd party accounts.
    public static let account = AccountService()
    
    /// An instance of `CaptureService` for handling data capture functionalities.
    public static var capture = CaptureService.init()
    
    /// An instance of `LicenseService` for managing data licenses.
    public static let license = LicenseService()
    
    public static var configuration: Configuration? = nil
    
    public static var rootViewController: UIViewController? = nil
    

    
    /// Initializes the rewards system and presents the home screen.
    ///
    /// - Parameters:
    ///    - `theme`: An optional parameter to set a custom theme. If not provided, the default theme is used.
    ///
    /// The home screen is presented modally with a cross-dissolve transition and a semi-transparent background.
    public static func start(_ theme: Theme? = nil, userId: String) throws {
        self.theme = theme ?? self.theme
        if(configuration == nil){
            throw NSError()
        }
        Task(priority: .high){
            try await CaptureReceipt.config(
                tikiPublishingID: configuration!.tikiPublishingID,
                microblinkLicenseKey: configuration!.microblinkLicenseKey,
                productIntelligenceKey: configuration!.productIntelligenceKey,
                terms: configuration!.terms
            )
            try await CaptureReceipt.initialize(userId: userId, config: Configuration(
                tikiPublishingID: "4a03c7fc-1533-48f4-b0e7-c34e49af91cf",
                microblinkLicenseKey: "sRwAAAEaY29tLm15dGlraS5jYXB0dXJlLnJlY2VpcHRuGv//0KdCFBQgFSNOuVduGfcqT3S6jLuPoAoP5bngYkX32/19dPBW2zVYisI6sB8SjLy9dgepoVdIs6sCZZPy7uWIcGKfdSGx8vgrEzd/phAThD+5mfJ6DTn/0eDRoFDn1/siDikIwWpsxJSRkjGBQysdOKmlhTtWHUHeNGwvAVrl6T64+Q==",
                productIntelligenceKey: "wSNX3mu+YGc/2I1DDd0NmrYHS6zS1BQt2geMUH7DDowER43JGeJRUErOHVwU2tz6xHDXia8BuvXQI3j37I0uYw==",
                terms: "terms for testing"))
            capture.initialize(userId: userId)
            DispatchQueue.main.async{
                rootViewController = UIApplication.shared.windows.first?.rootViewController
                let vc = UIHostingController(
                    rootView: HomeScreen(onDismiss: { rootViewController?.dismiss(animated: true) })
                )
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .crossDissolve
                vc.view.layer.backgroundColor = UIColor.black.withAlphaComponent(0.3).cgColor
                rootViewController!.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
    /// Configures the Capture Receipt SDK with the necessary parameters.
    ///
    /// - Parameters:
    ///   - tikiPublishingID: The TIKI publishing ID.
    ///   - microblinkLicenseKey: The Microblink license key.
    ///   - productIntelligenceKey: The product intelligence key.
    ///   - terms: The terms associated with the license.
    ///   - gmailAPIKey: The API key for Gmail (optional).
    ///   - outlookAPIKey: The API key for Outlook (optional).
    public static func config(
        tikiPublishingID: String,
        microblinkLicenseKey: String,
        productIntelligenceKey: String,
        terms: String,
        gmailAPIKey: String? = nil,
        outlookAPIKey: String? = nil
    ){
        self.configuration = Configuration(
            tikiPublishingID: tikiPublishingID,
            microblinkLicenseKey: microblinkLicenseKey,
            productIntelligenceKey: productIntelligenceKey,
            terms: terms,
            gmailAPIKey: gmailAPIKey,
            outlookAPIKey: outlookAPIKey
        )
        TikiRewards.LicenseService.setTerms(terms: terms)
    }
    
}
