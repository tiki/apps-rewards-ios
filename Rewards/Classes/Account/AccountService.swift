/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

public class AccountService{
    var _accounts: [Account] = []
    
    func accounts() -> [Account] {
        return _accounts
    }
    
    func accounts(for provider: AccountProvider) -> [Account] {
        var accounts: [Account] = []
        _accounts.forEach{ acc in
            if(acc.provider == provider){ accounts.append(acc) }
        }
        return accounts
    }
    
    func providers() -> [AccountProvider] {
        var providers = AccountProvider.all()
        _accounts.forEach{ acc in
            let index = providers.firstIndex(where: {
                acc.provider.name() == $0.name()
            })
            if(index != nil) {
                providers.remove(at: index!)
            }
        }
        return providers
    }

    func login(username: String, password: String, provider: AccountProvider) throws {
        if(username.isEmpty || password.isEmpty){
            throw TikiError.error("Username and password should not be empty.")
        }else{
            if(_accounts.first(where: {
                $0.username == username &&
                $0.provider == provider &&
                $0.status == .verified
            }) != nil) {
                throw TikiError.error("Account already linked.")
            }else{
                _accounts.append(
                    Account(username: username, provider: provider, status: .verified)
                )
            }
        }
    }

    func logout(username: String, provider: AccountProvider) throws {
        if(username.isEmpty){
            throw TikiError.error("Username should not be empty.")
        }else{
            let index = _accounts.firstIndex(where: {
                $0.username == username &&
                $0.provider == provider
            })
            if(index != nil) {
                _accounts.remove(at: index!)
            }else{
                throw TikiError.error("Account not found.")
            }
        }
    }
    
}
