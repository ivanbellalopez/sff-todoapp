import Foundation

protocol ListViewInterface: AnyObject {
    func setupView(title: String)
    func updateView()
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
    func fetchItems()
    func deleteItem(with id: String)
    func getItem(with id: String) -> Item
}

protocol ListWireframeInterface: AnyObject {
    func presentAddItem()
    func presentDetailItem(_ item: Item)
}
