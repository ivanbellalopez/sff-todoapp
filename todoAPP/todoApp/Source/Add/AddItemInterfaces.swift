import Foundation

protocol AddItemViewInterface: AnyObject {
    func setupView(title: String)
}

protocol AddItemPresenterInterface {
    var view: AddItemViewInterface? { get set }
    var interactor: AddItemInteractorInterface { get }
    var wireframe: AddItemWireframeInterface { get }

    func viewReady()
    func didCloseButtonTapped()
    func didAddButtonTapped(name: String, description: String)
}

protocol AddItemInteractorInterface: AnyObject {
    func addItem(name: String, description: String, completion: @escaping (Bool) -> Void)
}

protocol AddItemWireframeInterface: AnyObject {
    func dismiss()
}
