import Foundation

final class ListInteractor {

}

extension ListInteractor: ListInteractorInterface {

    func fetchItems() {

    }

    func deleteItem(with id: String) {
        if let index = todoItems.firstIndex(where: {$0.id == id}) {
            todoItems.remove(at: index)
        }
    }

    func getItem(with id: String) -> Item {
        if let index = todoItems.firstIndex(where: {$0.id == id}) {
            return todoItems[index]
        }

        return .init(id: "", name: "", description: "")
    }
}
