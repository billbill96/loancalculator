//
//  DataManager.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import PromiseKit
import ObjectMapper
import Alamofire

protocol DataManagerProtocol: class {
    func createToken(request: CreateTokenRequest) -> Promise<CreateTokenModel>
}

class DataManager: DataManagerProtocol {
    func createToken(request: CreateTokenRequest) -> Promise<CreateTokenModel> {
        return Promise<CreateTokenModel> { seal in
            let url = "https://loan-calculator.peerpower.co.th/oauth/token"
            let parameters: Parameters = [
                "grant_type": "\(request.grantType)",
                "client_id": "\(request.clientId)",
                "client_secret": "\(request.clientSecret)",
                "username":"\(request.username)",
                "password": "\(request.password)",
            ]
            
            AF.request(url, method: .post,
                       parameters: parameters,
                       encoding: JSONEncoding.default).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(let data):
                            guard let json = data as? [String: Any], let model = Mapper<CreateTokenModel>()
                                .map(JSON: json) else { return }
                            seal.fulfill(model)
                        case .failure(let error):
                            let errorModel = ErrorModel(error: error)
                            seal.reject(errorModel)
                        }
            }
        }
    }
    
    func reFreshtoken(request: RefreshTokenReqeust) -> Promise<RefreshTokenModel> {
        return Promise<RefreshTokenModel> { seal in
            let url = "https://loan-calculator.peerpower.co.th/oauth/token"
            let parameters: Parameters = [
                "grant_type": "\(request.grantType)",
                "client_id": "\(request.clientId)",
                "client_secret": "\(request.clientSecret)",
                "refresh_token":"\(request.refreshToken)",
                ]
                AF.request(url, method: .post,
                           parameters: parameters,
                           encoding: JSONEncoding.default).validate().responseJSON { (response) in
                            print(response)
                            switch response.result {
                            case .success(let data):
                                guard let json = data as? [String: Any], let model = Mapper<RefreshTokenModel>()
                                    .map(JSON: json) else { return }
                                seal.fulfill(model)
                            case .failure(let error):
                                let errorModel = ErrorModel(error: error)
                                seal.reject(errorModel)
                            }
                }

        }
        
    }
}
