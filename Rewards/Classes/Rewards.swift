/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public class Rewards{
    
    public static var theme: Theme = Theme()
    public static let account = AccountService()
    public static let capture = CaptureService()
    public static let license = LicenseService()
    
    public static func start(_ theme: Theme? = nil) {
        self.theme = theme ?? self.theme
        DispatchQueue.main.async {
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

}
