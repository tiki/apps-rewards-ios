/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct HomeScreen: View {
    
    let onDismiss: () -> Void
    @State var isLicensed: Bool = Rewards.isLicensed()
    
    
    var body: some View {
        if(isLicensed){
            HomeView(onDismiss: onDismiss, onLicenseDeclined: {
                Rewards.decline()
                isLicensed = false
            }, onLicenseAccepted: {Rewards.accept()})
        }
        if(!isLicensed){
            OfferView(onDismiss: onDismiss, onLicenseAccepted: {
                Rewards.accept()
                isLicensed = Rewards.isLicensed()
            })
        }

    }
}
