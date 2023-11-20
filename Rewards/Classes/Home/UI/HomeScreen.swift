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
            }, onLicenseAccepted: {Rewards.license()})
        }
        if(!isLicensed){
            OfferView(onDismiss: onDismiss, onLicenseAccepted: {
                Rewards.license()
                isLicensed = Rewards.isLicensed()
            })
        }

    }
}
