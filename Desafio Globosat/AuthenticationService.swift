//
//  AuthenticationService.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 14/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

// MARK: Login/Pass mock for use during auth
let defaultUser = "desafio"
let defaultPassword = "root"

class AuthenticationService: NSObject {
    
    // MARK: Singleton class - Init blocked
    private override init() {}
    
    // MARK: Shared Instance
    static let shared = AuthenticationService()
    
    // MARK: Authentication Persisted Data
    var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
        set(isLoggedIn) {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    // MARK: Login Functions
    
    func doLogin(user: String, password: String, completion: @escaping (_ isLoggedIn: Bool) -> Void) {
        isLoggedIn = user == defaultUser && password == defaultPassword
        
        // Using a timer to simulate network
        print("[AuthenticationService] Logging in...")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            print(self.isLoggedIn ? "[AuthenticationService] Successfully logged in" : "[AuthenticationService] Wrong user or password")
            completion(self.isLoggedIn)
        }
        
    }
    
    func logoff(completion: @escaping () -> Void) {
        isLoggedIn = false
        
        // Using a timer to simulate network
        print("[AuthenticationService] Logging off...")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            print("[AuthenticationService] Successfully logged off")
            completion()
        }
    }
    
}
