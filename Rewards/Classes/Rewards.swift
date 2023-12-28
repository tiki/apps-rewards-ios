/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI
import CaptureReceipt
import TikiSdk
import Card

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

    public static var company: Company? = nil
    
    public static var rootViewController: UIViewController? = nil
    
    public static var tikiPublishingID: String = "YOUR TIKI PUBLISHING ID"

    public static var microblinkLicenseKey: String = "YOUR MICROBLINK ANDROID LICENSE KEY"
    
    public static var productIntelligenceKey: String = "YOUR MICROBLINK IOS LICENSE KEY"
    
    public static var cards: [Card] = []
    
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
            try await CaptureReceipt.initialize(userId: userId)
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
        companyName: String,
        companyJurisdiction: String,
        privacy: String,
        terms: String,
        tikiPublishingID: String,
        microblinkLicenseKey: String,
        productIntelligenceKey: String,
        gmailAPIKey: String? = nil,
        outlookAPIKey: String? = nil,        
        primaryTextColor: Color? = nil,
        secondaryTextColor: Color? = nil,
        primaryBackgroundColor: Color? = nil,
        secondaryBackgroundColor: Color? = nil,
        accentColor: Color? = nil,
        fontFamily: String? = nil
    ){
        self.configuration = Configuration(
            tikiPublishingID: tikiPublishingID,
            microblinkLicenseKey: microblinkLicenseKey,
            productIntelligenceKey: productIntelligenceKey,
            terms: terms,
            gmailAPIKey: gmailAPIKey,
            outlookAPIKey: outlookAPIKey
        )
        company(name: companyName, jurisdiction: companyJurisdiction, privacy: privacy, terms: terms)
        license.setLicense(tikiPublishingID: tikiPublishingID, microblinkLicenseKey: microblinkLicenseKey, productIntelligenceKey: productIntelligenceKey)
        if(primaryTextColor != nil && secondaryTextColor != nil && primaryTextColor != nil && secondaryTextColor != nil && accentColor != nil && fontFamily != nil){
            theme(primaryTextColor: primaryTextColor!, secondaryTextColor: secondaryTextColor!, primaryBackgroundColor: primaryBackgroundColor!, secondaryBackgroundColor: secondaryBackgroundColor!, accentColor: accentColor!, fontFamily: fontFamily!)
        }
        TikiRewards.LicenseService.setTerms(terms: terms)
    }
    
    public static func company(name: String, jurisdiction: String, privacy: String, terms: String) {
        company = Company(name: name, jurisdiction: jurisdiction, privacy: privacy, terms: terms)
        TikiRewards.LicenseService.setTerms(terms: name+jurisdiction+privacy+terms)
    }
    
    public static func licenses(tikiPublishingID: String, microblinkLicenseKey: String, productIntelligenceKey: String) {

        license.setLicense(tikiPublishingID: tikiPublishingID, microblinkLicenseKey: microblinkLicenseKey, productIntelligenceKey: productIntelligenceKey)
    }
    
    public static func oauth(gmailAPIKey: String?, outlookAPIKey: String?, userId: String){
        if(gmailAPIKey != nil){
            self.configuration?.gmailAPIKey = gmailAPIKey
        }
        if(outlookAPIKey != nil){
            self.configuration?.outlookAPIKey = outlookAPIKey
        }
        Task(){
            try start(userId: userId)

        }
    }
    
    public static func theme(primaryTextColor: Color,
                                secondaryTextColor: Color,
                                primaryBackgroundColor: Color,
                                secondaryBackgroundColor: Color,
                                accentColor: Color,
                                fontFamily: String){
        self.theme = Theme(primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, primaryBackgroundColor: primaryBackgroundColor, secondaryBackgroundColor: secondaryBackgroundColor, accentColor: accentColor, fontFamily: fontFamily)
        
    }
    
    public static func card(card: Card...){
        self.cards.append(card)
    }
    public static func cards(cards: [Card]){
        for card in cards {
            self.cards.append(card)
        }
    }
    public static func getCards() -> [Card] {
        return self.cards
    }
    public static func removeCard(cardToRemove: Card){
        var idx = 0
        for card in self.cards {
            if(Card.equal(card1: card, card2: cardToRemove)){
                cards.remove(at: idx)
                break
            }
            idx++
        }
        
        
    }
}
