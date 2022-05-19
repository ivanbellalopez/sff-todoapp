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

    // Delete
    case deleteItem(id: String)

    // Add

    // Modify
}

extension RepositoryTarget: TargetType {
    public var baseURL: URL { URL(string: "https://webappsffrg1.azurewebsites.net")! }

    public var path: String {
        switch self {
        case .getItems:
            return "/api/Task"

        case .deleteItem(let id):
            return "/api/Task/\(id)"

        }
    }

    public var method: Moya.Method {
        switch self {
        case .getItems:
            return .get
        case .deleteItem:
            return .delete
        }
    }

    public var task: Task {
        switch self {
        case .getItems, .deleteItem:
            return .requestPlain
        }
    }

    public var sampleData: Data {
        Data()
    }

    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
