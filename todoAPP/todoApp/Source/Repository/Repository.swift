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
    func getItems(result: @escaping ItemResult)
    func deleteItem(with id: String, result: @escaping (Bool) -> Void)
    func addItem(_ item: Item, result: @escaping (Bool) -> Void)
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

    func deleteItem(with id: String, result: @escaping (Bool) -> Void) {
        provider.request(.deleteItem(id: id)) { response in
            switch response {
            case .success:
                result(true)

            case .failure:
                result(false)
            }
        }
    }

    func addItem(_ item: Item, result: @escaping (Bool) -> Void) {
        provider.request(.addItem(item)) { response in
            switch response {
            case .success:
                result(true)

            case .failure:
                result(false)
            }
        }
    }
}
