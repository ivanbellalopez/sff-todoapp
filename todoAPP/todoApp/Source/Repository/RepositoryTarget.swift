//
//  RepositoryTarget.swift
//  todoApp
//
//  Created by Ivan Bella on 19/5/22.
//

import Foundation
import Moya

public enum RepositoryTarget {
    // Get
    case getItems
    case getItem(id: String)

    // Delete
    case deleteItem(id: String)

    // Add
    case addItem(_ item: Item)

    // Modify
    case updateItem(_ item: Item)
}

extension RepositoryTarget: TargetType {
    public var baseURL: URL { URL(string: "https://webappsffrg1.azurewebsites.net")! }

    public var path: String {
        switch self {
        case .getItems, .addItem:
            return "/api/Task"

        case .getItem(let id) , .deleteItem(let id):
            return "/api/Task/\(id)"

        case .updateItem(let item):
            return "/api/Task/\(item.id)"

        }
    }

    public var method: Moya.Method {
        switch self {
        case .getItems, .getItem:
            return .get
        case .deleteItem:
            return .delete
        case .addItem:
            return .post
        case .updateItem:
            return .put
        }
    }

    public var task: Task {
        switch self {
        case .getItems, .getItem, .deleteItem:
            return .requestPlain
        case .addItem(let item), .updateItem(let item):
            return .requestJSONEncodable(item)
        }
    }

    public var sampleData: Data {
        Data()
    }

    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
