import Foundation

protocol ListViewInterface: AnyObject {
    func setupView(title: String)
    func updateView(with items: [Item])
}

protocol ListPresenterInterface {
    var view: ListViewInterface? { get set }
    var interactor: ListInteractorInterface { get }
    var wireframe: ListWireframeInterface { get }

    func viewReady()
    func viewWillAppear()

    func addItemTapped()
    func itemTapped(with id: String)
    func deleteItemTapped(with id: String)
}

protocol ListInteractorInterface: AnyObject {
    func getItems(completion: @escaping (Bool) -> Void)
    func deleteItem(with id: String, completion: @escaping (Bool) -> Void)
    func getItem(with id: String) -> Item
}

protocol ListWireframeInterface: AnyObject {
    func presentAddItem()
    func presentDetailItem(_ item: Item)
}
