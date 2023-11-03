class UIFont {
    static func registerSpaceGrotesk() -> Bool {
        let bundle = Bundle(for: Rewards.self)
        let resourceBundle = Bundle(url: bundle.url(forResource: "RewardsFont", withExtension: "bundle")!)! // bundle_name is bundle name from your Podspec file
        guard let fontURL = resourceBundle.url(forResource: "SpaceGrotesk", withExtension: "ttf") else {
            fatalError("Couldn't find font SpaceGrotesk")
        }
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterFontsForURL(fontURL as CFURL, .persistent, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }

        return true
    }
}
