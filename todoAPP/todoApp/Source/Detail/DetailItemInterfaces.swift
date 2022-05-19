import Foundation

protocol DetailItemViewInterface: AnyObject {
    func setupView(title: String, name: String, description: String)
}

protocol DetailItemPresenterInterface {
    var view: DetailItemViewInterface? { get set }
    var interactor: DetailItemInteractorInterface { get }
    var wireframe: DetailItemWireframeInterface { get }

    func viewReady()
    func didUpdateButtonTapped(name: String, description: String)
}

protocol DetailItemInteractorInterface: AnyObject {
    func getItem(with id: String, completion: @escaping ItemResult)
    func updateItem(_ item: Item, completion: @escaping BoolResult)
}

protocol DetailItemWireframeInterface: AnyObject {
    func goBack()
}
