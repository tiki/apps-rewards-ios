/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public class Rewards{
    
    public static func start() {
        DispatchQueue.main.async {
            let _ = Font.registerSpaceGrotesk()
            let viewController = UIApplication.shared.windows.first?.rootViewController
            let vc = UIHostingController(
                rootView: Retailer()
            )
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.view.layer.backgroundColor = UIColor.black.withAlphaComponent(0.3).cgColor
            viewController!.present(vc, animated: true, completion: nil)
        }
    }
    
}
