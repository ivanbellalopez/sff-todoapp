import Foundation

final class ListInteractor {
    private let repository: RepositoryInterface

    init(repository: RepositoryInterface) {
        self.repository = repository
    }
}

extension ListInteractor: ListInteractorInterface {

    func getItems(completion: @escaping BoolResult) {
        repository.getItems { itemArray in
            todoItems = itemArray
            completion(true)
        }
    }

    func deleteItem(with id: String, completion: @escaping BoolResult) {
        repository.deleteItem(with: id) { [weak self] result in
            if result {
                self?.getItems(completion: completion)
            }
        }
    }

    func getItem(with id: String) -> Item {
        if let index = todoItems.firstIndex(where: {$0.id == id}) {
            return todoItems[index]
        }

        return .init(id: "", name: "", description: "")
    }
}
