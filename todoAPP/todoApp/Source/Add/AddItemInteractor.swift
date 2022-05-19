import Foundation

final class AddItemInteractor {

    // Set the apropiate repository for your interactor.
    // REMEMBER configure set the instancie on the AddItemConfigurator
    // var repository: AddItemRepository!
}

extension AddItemInteractor: AddItemInteractorInterface {
    func addItem(name: String, description: String) {
        let item = createItem(name: name, description: description)
        todoItems.append(item)
        print(item)
    }
}

private extension AddItemInteractor {
    func createItem(name: String, description: String) -> Item {
        Item(id: UUID().uuidString, name: name, description: description)
    }
}
