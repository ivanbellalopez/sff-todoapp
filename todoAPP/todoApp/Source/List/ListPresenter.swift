import Foundation
import RxSwift

final class ListPresenter {

    weak var view: ListViewInterface?
    let interactor: ListInteractorInterface
    let wireframe: ListWireframeInterface

    init(interactor: ListInteractorInterface, wireframe: ListWireframeInterface) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension ListPresenter: ListPresenterInterface {

    func viewReady() {
        view?.setupView(title: "TODO App")
    }

    func viewWillAppear() {
        interactor.getItems { [weak self] result in
            if result {
                self?.view?.updateView(with: todoItems)
            }
        }
    }

    func addItemTapped() {
        wireframe.presentAddItem()
    }

    func itemTapped(with id: String) {
        let item = interactor.getItem(with: id)
        wireframe.presentDetailItem(item)
    }

    func deleteItemTapped(with id: String) {
        interactor.deleteItem(with: id) { [weak self] result in
            if result {
                self?.view?.updateView(with: todoItems)
            }
        }
    }
}
