import Foundation

final class DetailItemInteractor {

    private let repository: RepositoryInterface

    init(repository: RepositoryInterface) {
        self.repository = repository
    }

}

extension DetailItemInteractor: DetailItemInteractorInterface {
    func getItem(with id: String, completion: @escaping (Item?) -> Void) {
        repository.getItem(with: id) { item in
            completion(item)
        }
    }

    func updateItem(_ item: Item) {
        if let index = todoItems.firstIndex(where: {$0.id == item.id}) {
            todoItems[index] = item
        }
    }
}

private extension DetailItemInteractor {}
