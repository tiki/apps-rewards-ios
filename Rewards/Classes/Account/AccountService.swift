/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

///
/// # CaptureService
///
/// The `CaptureService` class provides functionalities related to capturing and processing data, 
/// such as scanning physical and digital receipts and retrieving offers and contributors.
///
/// ## Example
///
/// To use the `CaptureService` class, follow the example below:
///
/// ```swift
/// let captureService = CaptureService()
///
/// // Trigger receipt scanning
/// captureService.scan()
///
/// // Retrieve offers for a specific account provider
/// let providerOffers = captureService.offers(provider: .yourProvider)
///
/// // Retrieve the largest contributors
/// let contributors = captureService.largestContributors()
public class AccountService{
// MARK: - Properties

/// An array containing the user accounts managed by the service.
var _accounts: [Account] = []

// MARK: - Public Methods

/// Retrieves all user accounts stored in the service.
///
/// - Returns: An array of user accounts.
func accounts() -> [Account] {
    return _accounts
}

/// Retrieves user accounts associated with a specific `AccountProvider`.
///
/// - Parameter provider: The account provider for which accounts should be retrieved.
/// - Returns: An array of user accounts for the specified provider.
func accounts(for provider: AccountProvider) -> [Account] {
    var accounts: [Account] = []
    _accounts.forEach { acc in
        if acc.provider == provider { accounts.append(acc) }
    }
    return accounts
}

/// Retrieves available `AccountProvider`, excluding those already associated with existing accounts.
///
/// - Returns: An array of available account providers.
func providers() -> [AccountProvider] {
    var providers = AccountProvider.all()
    _accounts.forEach { acc in
        let index = providers.firstIndex(where: {
            acc.provider.name() == $0.name()
        })
        if index != nil {
            providers.remove(at: index!)
        }
    }
    return providers
}

/// Logs in a user by creating a new account or verifying an existing one.
///
/// - Parameters:
///   - username: The username for the account.
///   - password: The password for the account.
///   - provider: The account provider for the login.
/// - Returns: The logged-in user account.
/// - Throws: An error indicating issues with the login process, such as empty credentials or an already linked account.
func login(username: String, password: String, provider: AccountProvider) throws -> Account {
    if username.isEmpty || password.isEmpty {
        throw TikiError.error("Username and password should not be empty.")
    } else {
        if _accounts.first(where: {
            $0.username == username &&
                $0.provider == provider &&
                $0.status == .verified
        }) != nil {
            throw TikiError.error("Account already linked.")
        } else {
            let account = Account(username: username, provider: provider, status: .verified)
            _accounts.append(account)
            return account
        }
    }
}

/// Logs out a user by removing the associated account.
///
/// - Parameters:
///   - username: The username of the account to be logged out.
///   - provider: The account provider of the account to be logged out.
/// - Returns: The logged-out user account.
/// - Throws: An error indicating issues with the logout process, such as an empty username or an account not found.
func logout(username: String, provider: AccountProvider) throws -> Account {
    if username.isEmpty {
        throw TikiError.error("Username should not be empty.")
    } else {
        let index = _accounts.firstIndex(where: {
            $0.username == username &&
                $0.provider == provider
        })
        if index != nil {
            let account = _accounts[index!]
            _accounts.remove(at: index!)
            return account
        } else {
            throw TikiError.error("Account not found.")
        }
    }
}
}
