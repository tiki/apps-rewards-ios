/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public class Rewards{
    
    public static var theme = Theme()
    private static var _accounts: [Account] = []
    private static var _isLicensed: Bool = false


    public static func start(theme: Theme?) {
        self.theme = theme ?? self.theme
        DispatchQueue.main.async {
            let _ = Font.registerSpaceGrotesk()
            let viewController = UIApplication.shared.windows.first?.rootViewController
            let vc = UIHostingController(
                rootView: HomeScreen(onDismiss: {viewController?.dismiss(animated: true)})
            )
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.view.layer.backgroundColor = UIColor.black.withAlphaComponent(0.3).cgColor
            viewController!.present(vc, animated: true, completion: nil)
        }
    }

    static func isLicensed() -> Bool{
        return _isLicensed
    }
    
    static func license() {
        _isLicensed = true
    }

    static func decline() {
        _isLicensed = false
    }

    static func estimate() -> OfferEstimate {
        return OfferEstimate(min: 5, max: 15)
    }

    static func earnings() -> HomeEarnings {
        return HomeEarnings(total: 34.30, rating: 4.8, bonus: 12.00)
    }

    static func terms() -> String {
        return _terms
    }

    static func scan(context: UIViewController) {
        let message = "Receipt scanning functionality not implemented in demo app."
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        context.present(alertController, animated: true, completion: nil)
    }

    static func offers(provider: AccountEnum) -> [RetailerOffer] {
        return [
            RetailerOffer(provider: provider, description: "4% cashback on electronics"),
            RetailerOffer(provider: provider, description: "10% off on electronics")
        ]
    }

    static func accounts() -> [Account] {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(
                Account(accountCommon: AccountCommon(name: account, type: account.rawValue == "GMAIL" ? .EMAIL : .RETAILER), status: .verfied)
            )
        }
        acc[3].status = .unverify
        return [acc[0],acc[1],acc[2]]
    }

    static func availableAccounts() -> [AccountEnum] {
        var availableAccounts: [AccountEnum] = []
        for accountCommon in AccountEnum.allCases {
            let loggedIn = _accounts.first(where: {
                $0.accountCommon.name == accountCommon
            })
            if(loggedIn == nil){
                availableAccounts.append(accountCommon)
            }
        }
        return availableAccounts
    }

    static func login(account: Account) {
        if(account.username != nil && !account.username!.isEmpty && account.password != nil && !account.password!.isEmpty){
            if(_accounts.first(where: { $0 == account }) == nil) {
                account.status = .sync
                _accounts.append(account)
            }
        }
    }

    static func logout(account: Account) {
        if(account.username != nil && !account.username!.isEmpty){
            let index = _accounts.firstIndex(where: { $0 == account })
            if(index != nil && index! > 0) {
                account.status = .sync
                _accounts.remove(at: index!)
            }
        }
    }
    
    static func largestContributors() -> [MoreContributor] {
        return [
            MoreContributor(name: "Walmart", percentage: 0.4),
            MoreContributor(name: "Kroger", percentage: 0.3),
            MoreContributor(name: "Dollar General", percentage: 0.2)
        ]
    }

    private static let _terms = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ... (Your long terms and conditions string)"
        
}
