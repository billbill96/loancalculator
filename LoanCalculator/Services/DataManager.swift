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
    func refreshToken(request: RefreshTokenReqeust) -> Promise<RefreshTokenModel>
    func getUser() -> Promise<UserModel>
    func createLoan(request: CreateLoanRequest, type: AddLoanPageType) -> Promise<LoanListModel>
    func deleteLoan(request: LoanRequest) -> Promise<Void>
    func getLoanPreview(request: CreateLoanRequest) -> Promise<LoanListModel>
    func getLoanList() -> Promise<[LoanListModel]>
    func getLoan(request: LoanRequest) -> Promise<LoanListModel>
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
    
    func refreshToken(request: RefreshTokenReqeust) -> Promise<RefreshTokenModel> {
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
    
    func getUser() -> Promise<UserModel> {
        return Promise<UserModel> { seal in
            let url = "https://loan-calculator.peerpower.co.th/api/user"
            let token = UserDefaults.standard.string(forKey: "beaerToken")
            let header: HTTPHeaders = [.authorization(bearerToken: token ?? "")]
            
            AF.request(url, method: .get,
                       encoding: JSONEncoding.default,
                       headers: header).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(let data):
                            guard let json = data as? [String: Any], let model = Mapper<UserModel>()
                                .map(JSON: json) else { return }
                            seal.fulfill(model)
                        case .failure(let error):
                            let errorModel = ErrorModel(error: error)
                            seal.reject(errorModel)
                        }
            }
        }
    }
    
    func getLoanList() -> Promise<[LoanListModel]> {
        return Promise<[LoanListModel]> { seal in
            let url = "https://loan-calculator.peerpower.co.th/api/loans/"
            let token = UserDefaults.standard.string(forKey: "beaerToken")
            let header: HTTPHeaders = [.authorization(bearerToken: token ?? "")]
            
            AF.request(url, method: .get,
                       encoding: JSONEncoding.default,
                       headers: header).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(let data):
                            guard let json = data as? [String: Any], let model = Mapper<LoanListModel>()
                                .mapArray(JSONObject: json["data"]) else { return }
                            seal.fulfill(model)
                        case .failure(let error):
                            let errorModel = ErrorModel(error: error)
                            seal.reject(errorModel)
                        }
            }
        }
    }
    
    func getLoan(request: LoanRequest) -> Promise<LoanListModel> {
        return Promise<LoanListModel> { seal in
            let url = "https://loan-calculator.peerpower.co.th/api/loans/\(request.loanId)"
            let token = UserDefaults.standard.string(forKey: "beaerToken")
            let header: HTTPHeaders = [.authorization(bearerToken: token ?? "")]
            
            AF.request(url, method: .get,
                       encoding: JSONEncoding.default,
                       headers: header).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(let data):
                            guard let json = data as? [String: Any], let model = Mapper<LoanListModel>()
                                .map(JSON: json) else { return }
                            seal.fulfill(model)
                        case .failure(let error):
                            let errorModel = ErrorModel(error: error)
                            seal.reject(errorModel)
                        }
            }
        }
    }
    
    func deleteLoan(request: LoanRequest) -> Promise<Void> {
        return Promise<Void> { seal in
            let url = "https://loan-calculator.peerpower.co.th/api/loans/\(request.loanId)"
            let token = UserDefaults.standard.string(forKey: "beaerToken")
            let header: HTTPHeaders = [.authorization(bearerToken: token ?? "")]
            
            AF.request(url, method: .delete,
                       encoding: JSONEncoding.default,
                       headers: header).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(_):
                            seal.fulfill(())
                        case .failure(let error):
                            let errorModel = ErrorModel(error: error)
                            seal.reject(errorModel)
                        }
            }
        }
    }
    
    func createLoan(request: CreateLoanRequest, type: AddLoanPageType) -> Promise<LoanListModel> {
        return Promise<LoanListModel> { seal in
            let loanId = "\(request.loadId ?? 0)"
            let url = "https://loan-calculator.peerpower.co.th/api/loans/\(loanId == "0" ? "" : loanId)"
            let token = UserDefaults.standard.string(forKey: "beaerToken")
            let header: HTTPHeaders = [.authorization(bearerToken: token ?? "")]
            let parameters: Parameters = [
                "loan_amount": "\(request.loanAmount)",
                "loan_term": "\(request.loanTerm)",
                "interest_rate": "\(request.interestRate)",
                "start_month": "\(request.startMonth)",
                "start_year": "\(request.startYear)"
            ]
            
            AF.request(url, method: type == .add ? .post : .put,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       headers: header).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(let data):
                            guard let json = data as? [String: Any], let model = Mapper<LoanListModel>()
                                .map(JSONObject: json["data"]) else { return }
                            seal.fulfill(model)
                        case .failure(let error):
                            let errorModel = ErrorModel(error: error)
                            seal.reject(errorModel)
                        }
            }

            
        }
    }
    
    func getLoanPreview(request: CreateLoanRequest) -> Promise<LoanListModel> {
        return Promise<LoanListModel> { seal in
            let url = "https://loan-calculator.peerpower.co.th/api/loans/preview"
            let token = UserDefaults.standard.string(forKey: "beaerToken")
            let header: HTTPHeaders = [.authorization(bearerToken: token ?? "")]
            
            let parameters: Parameters = [
                "loan_amount": "\(request.loanAmount)",
                "loan_term": "\(request.loanTerm)",
                "interest_rate": "\(request.interestRate)",
                "start_month": "\(request.startMonth)",
                "start_year": "\(request.startYear)"
            ]

            AF.request(url, method: .get,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       headers: header).validate().responseJSON { (response) in
                        print(response)
                        switch response.result {
                        case .success(let data):
                            guard let json = data as? [String: Any], let model = Mapper<LoanListModel>()
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
