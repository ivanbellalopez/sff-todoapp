import Foundation

final class DetailItemPresenter {

    weak var view: DetailItemViewInterface?
    let interactor: DetailItemInteractorInterface
    let wireframe: DetailItemWireframeInterface
    private var item: Item

    init(interactor: DetailItemInteractorInterface, wireframe: DetailItemWireframeInterface, item: Item) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.item = item
    }
}

extension DetailItemPresenter: DetailItemPresenterInterface {

    func viewReady() {
        view?.setupView(title: "", name: item.name, description: item.description)
    }

    func didUpdateButtonTapped(name: String, description: String) {
        let item = Item(id: item.id, name: name, description: description)
        interactor.updateItem(item)
        wireframe.goBack()
    }
}

private extension DetailItemPresenter {}
