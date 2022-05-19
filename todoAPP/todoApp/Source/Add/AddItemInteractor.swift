import Foundation

final class AddItemInteractor {
    private let repository: RepositoryInterface

    init(repository: RepositoryInterface) {
        self.repository = repository
    }
}

extension AddItemInteractor: AddItemInteractorInterface {
    func addItem(name: String, description: String, completion: @escaping (Bool) -> Void) {
        let item = createItem(name: name, description: description)
        repository.addItem(item) { result in
            completion(true)
        }
    }
}

private extension AddItemInteractor {
    func createItem(name: String, description: String) -> Item {
        Item(id: UUID().uuidString, name: name, description: description)
    }
}
