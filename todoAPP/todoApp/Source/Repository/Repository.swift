//
//  Repository.swift
//  todoApp
//
//  Created by Ivan Bella on 19/5/22.
//

import Foundation
import Moya
import RxSwift

public typealias ItemsResult = ([Item]) -> Void
public typealias ItemResult = (Item?) -> Void
public typealias BoolResult = (Bool) -> Void

protocol RepositoryInterface {
    func getItems(result: @escaping ItemsResult)
    func getItem(with id: String, result: @escaping ItemResult)
    func deleteItem(with id: String, result: @escaping BoolResult)
    func addItem(_ item: Item, result: @escaping BoolResult)
    func updateItem(_ item: Item, result: @escaping BoolResult)
}

final class Repository {

    let provider = MoyaProvider<RepositoryTarget>()
}

extension Repository: RepositoryInterface {

    public func getItems(result: @escaping ItemsResult) {
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

    func getItem(with id: String, result: @escaping ItemResult) {
        provider.request(.getItem(id: id)) { response in
            switch response {
            case .success(let data):
                do {
                    let item = try data
                        .filterSuccessfulStatusCodes()
                        .map(Item.self)
                    result(item)
                } catch {
                    result(nil)
                }

            case .failure:
                result(nil)
            }
        }
    }

    func deleteItem(with id: String, result: @escaping BoolResult) {
        provider.request(.deleteItem(id: id)) { response in
            switch response {
            case .success:
                result(true)

            case .failure:
                result(false)
            }
        }
    }

    func addItem(_ item: Item, result: @escaping BoolResult) {
        provider.request(.addItem(item)) { response in
            switch response {
            case .success:
                result(true)

            case .failure:
                result(false)
            }
        }
    }

    func updateItem(_ item: Item, result: @escaping BoolResult) {
        provider.request(.updateItem(item)) { response in
            switch response {
            case .success:
                result(true)

            case .failure:
                result(false)
            }
        }
    }
}
