var todoItems: [Item] = []

public struct Item: Codable {
    let id: String
    let name: String
    let description: String
}
