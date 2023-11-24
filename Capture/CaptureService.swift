/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

public class CaptureService{
    func scan() {
        let viewController = UIApplication.shared.windows.first?.rootViewController
        let message = "Receipt scanning functionality not implemented in demo app."
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController!.present(alertController, animated: true, completion: nil)
    }

    func offers(provider: AccountProvider) -> [RetailerOffer] {
        return [
            RetailerOffer(provider: provider, description: "4% cashback on electronics"),
            RetailerOffer(provider: provider, description: "10% off on electronics")
        ]
    }

    func largestContributors() -> [MoreContributor] {
        return [
            MoreContributor(name: "Walmart", percentage: 0.4),
            MoreContributor(name: "Kroger", percentage: 0.3),
            MoreContributor(name: "Dollar General", percentage: 0.2)
        ]
    }
}
