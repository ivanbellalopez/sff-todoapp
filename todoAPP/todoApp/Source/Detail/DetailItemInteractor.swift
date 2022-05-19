import Foundation

final class DetailItemInteractor {

    // Set the apropiate repository for your interactor.
    // REMEMBER configure set the instancie on the DetailItemConfigurator
    // var repository: DetailItemRepository!
}

extension DetailItemInteractor: DetailItemInteractorInterface {
    func updateItem(_ item: Item) {
        if let index = todoItems.firstIndex(where: {$0.id == item.id}) {
            todoItems[index] = item
        }
    }
}

private extension DetailItemInteractor {}
