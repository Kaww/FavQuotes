//
//  QuotesService.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import Foundation
import Alamofire


class QuotesService {
    static let shared = QuotesService(baseURL: "https://favqs.com/api/quotes/")
    
    let baseURL: String
    private let headers = [
        "Authorization": "Token 7ba7e70067a67db23bca653b3e568576",
        "Content-Type": "application/json"
    ]
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getQuotes(responseHandler: @escaping ([Quote]) -> Void) {
        if let user = DefaultsService.shared.getUser() {
            let url = "\(self.baseURL)?filter=\(user.username)&type=user"
            
            AF.request(url, method: .get, headers: .init(self.headers))
            .validate()
            .responseDecodable(of: QuotesObjectRequest.self) { response in
                if let res = response.value {
                    responseHandler(res.quotes)
                }
            }
        }
    }
    
    func getQuotes(username: String, responseHandler: @escaping ([Quote]) -> Void) {
        // TODO: try to log username
        
        let url = "\(self.baseURL)?filter=\(username)&type=user"
        
        AF.request(url, method: .get, headers: .init(self.headers))
        .validate()
        .responseDecodable(of: QuotesObjectRequest.self) { response in
            if let res = response.value {
                // user exist !
                DefaultsService.shared.createUser(user: User(username: username))
                responseHandler(res.quotes)
            }
        }
    }
    
}
