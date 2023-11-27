/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

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
class Rewards{

/// The current theme.
public static var theme: Theme = Theme()

/// An instance of `AccountService` for managing 3rd party accounts.
public static let account = AccountService()

/// An instance of `CaptureService` for handling data capture functionalities.
public static let capture = CaptureService()

/// An instance of `LicenseService` for managing data licenses.
public static let license = LicenseService()

/// Initializes the rewards system and presents the home screen.
///
/// - Parameters:
///    - `theme`: An optional parameter to set a custom theme. If not provided, the default theme is used.
///
/// The home screen is presented modally with a cross-dissolve transition and a semi-transparent background.
public static func start(_ theme: Theme? = nil) {
    self.theme = theme ?? self.theme
    
    DispatchQueue.main.async {
        let viewController = UIApplication.shared.windows.first?.rootViewController
        let vc = UIHostingController(
            rootView: HomeScreen(onDismiss: { viewController?.dismiss(animated: true) })
        )
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.view.layer.backgroundColor = UIColor.black.withAlphaComponent(0.3).cgColor
        viewController!.present(vc, animated: true, completion: nil)
    }
}

