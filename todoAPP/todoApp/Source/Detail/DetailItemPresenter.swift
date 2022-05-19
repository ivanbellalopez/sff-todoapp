import Foundation

final class DetailItemPresenter {

    weak var view: DetailItemViewInterface?
    let interactor: DetailItemInteractorInterface
    let wireframe: DetailItemWireframeInterface
    private let itemId: String

    init(interactor: DetailItemInteractorInterface, wireframe: DetailItemWireframeInterface, itemId: String) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.itemId = itemId
    }
}

extension DetailItemPresenter: DetailItemPresenterInterface {

    func viewReady() {
        interactor.getItem(with: itemId) { [weak self] item in
            guard let item = item else {
                return
            }

            self?.view?.setupView(title: "", name: item.name, description: item.description)
        }
    }

    func didUpdateButtonTapped(name: String, description: String) {
//        let item = Item(id: item.id, name: name, description: description)
//        interactor.updateItem(item)
        wireframe.goBack()
    }
}

private extension DetailItemPresenter {}
