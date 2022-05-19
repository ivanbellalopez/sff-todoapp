import Foundation

final class AddItemPresenter {

    weak var view: AddItemViewInterface?
    let interactor: AddItemInteractorInterface
    let wireframe: AddItemWireframeInterface

    init(interactor: AddItemInteractorInterface, wireframe: AddItemWireframeInterface) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension AddItemPresenter: AddItemPresenterInterface {


    func viewReady() {
        view?.setupView(title: "Add")
    }

    func didAddButtonTapped(name: String, description: String) {
        interactor.addItem(name: name, description: description)
        wireframe.dismiss()
    }

    func didCloseButtonTapped() {
        wireframe.dismiss()
    }
}

private extension AddItemPresenter {}
