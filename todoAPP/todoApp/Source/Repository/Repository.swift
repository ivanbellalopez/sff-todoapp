//
//  Repository.swift
//  todoApp
//
//  Created by Ivan Bella on 19/5/22.
//

import Foundation
import Moya
import RxSwift

public typealias ItemResult = ([Item]) -> Void

protocol RepositoryInterface {
    // Get
    func getItems(result: @escaping ItemResult)

    // Delete

    // Add

    // Modify
}

final class Repository {

    let provider = MoyaProvider<RepositoryTarget>()
}

extension Repository: RepositoryInterface {

    public func getItems(result: @escaping ItemResult) {
        provider.request(.getItems) { response in
            switch response {
            case .success(let data):
                do {
                    let items = try data
                        .filterSuccessfulStatusCodes()
                        .map([Item].self)
                    result(items)
                } catch {
                    result([])
                }

            case .failure:
                result([])
            }
        }
    }
}
