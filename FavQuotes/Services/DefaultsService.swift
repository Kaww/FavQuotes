//
//  DefaultsService.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import Foundation


class DefaultsService {
    static let shared = DefaultsService()
    
    private let userKey = "user_key"
    private let quotesKey = "quotes_key"
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    
    // MARK: - User methods
    func createUser(user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            defaults.set(encoded, forKey: userKey)
        }
    }
    
    func getUser() -> User? {
        if let data = defaults.data(forKey: userKey) {
            if let decoded = try? JSONDecoder().decode(User.self, from: data) {
                return decoded
            }
        }
        return nil
    }
    
    func deleteUser() {
        defaults.removeObject(forKey: userKey)
    }
    
    
    // MARK: - Quotes methods
    func createQuotes(quotes: [Quote]) {
        if let encoded = try? JSONEncoder().encode(quotes) {
            defaults.set(encoded, forKey: quotesKey)
        }
    }
    
    func getQuotes() -> [Quote] {
        if getUser() == nil {
            deleteUser()
            deleteQuotes()
            return []
        }
        
        if let data = defaults.data(forKey: quotesKey) {
            if let decoded = try? JSONDecoder().decode([Quote].self, from: data) {
                print("recover quotes from defaults, user \(getUser()!) is logged")
                return decoded
            }
        }
        
        return []
    }
    
    func deleteQuotes() {
        defaults.removeObject(forKey: userKey)
    }
    
}
