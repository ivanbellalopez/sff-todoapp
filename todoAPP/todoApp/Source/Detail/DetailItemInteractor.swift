import Foundation

final class DetailItemInteractor {

    private let repository: RepositoryInterface

    init(repository: RepositoryInterface) {
        self.repository = repository
    }

}

extension DetailItemInteractor: DetailItemInteractorInterface {

    func getItem(with id: String, completion: @escaping ItemResult) {
        repository.getItem(with: id) { item in
            completion(item)
        }
    }

    func updateItem(_ item: Item, completion: @escaping BoolResult) {
        repository.updateItem(item) { result in
            completion(result)
        }
    }
}
