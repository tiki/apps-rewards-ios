/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public class Rewards{
    
    private static var accounts: [Account] = []
    private static var isLicensed: Bool = false

    public static func start() {
        DispatchQueue.main.async {
            let _ = Font.registerSpaceGrotesk()
            let viewController = UIApplication.shared.windows.first?.rootViewController
            let vc = UIHostingController(
                rootView: RetailerView()
            )
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.view.layer.backgroundColor = UIColor.black.withAlphaComponent(0.3).cgColor
            viewController!.present(vc, animated: true, completion: nil)
        }
    }

    static func license() {
        isLicensed = true
    }

    static func decline() {
        isLicensed = false
    }

    static func estimate() -> OfferEstimate {
        return OfferEstimate(min: 5, max: 15)
    }

    static func earnings() -> HomeEarnings {
        return HomeEarnings(total: 34.30, rating: 4.8, bonus: 12.00)
    }

    static func terms() -> String {
        return terms
    }

    static func scan(context: UIViewController) {
        let message = "Receipt scanning functionality not implemented in demo app."
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        context.present(alertController, animated: true, completion: nil)
    }

    static func offers(provider: AccountCommon) -> [Offer] {
        return [
            Offer(provider: provider, description: "4% cashback on electronics"),
            Offer(provider: provider, description: "10% off on electronics")
        ]
    }

    static func accounts() -> [Account] {
        return accounts
    }

    static func availableAccounts() -> [AccountCommon] {
        var availableAccounts: [AccountCommon] = []
        let connectedAccts = accounts
        for accountCommon in AccountCommon.allCases {
            if connectedAccts.first(where: { $0.accountCommon == accountCommon }) == nil {
                availableAccounts.append(accountCommon)
            }
        }
        return availableAccounts
    }

    static func login(account: Account) {
        if !account.username.isEmpty,
            let password = account.password,
            accounts.first(where: { $0.accountCommon == account.accountCommon && $0.username == account.username }) == nil {
            account.accountStatus = .linked
            accounts.append(account)
        }
    }

    static func logout(account: Account) {
        if !account.username.isEmpty {
            if let connectedAccountIndex = accounts.firstIndex(where: { $0.accountCommon == account.accountCommon && $0.username == account.username }) {
                accounts.remove(at: connectedAccountIndex)
            }
        }
    }

    private static let terms = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ... (Your long terms and conditions string)"
        
}
