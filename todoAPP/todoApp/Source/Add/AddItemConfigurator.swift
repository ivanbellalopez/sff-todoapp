import UIKit

final class AddItemConfigurator {

    class func prepareScene() -> AddItemViewController {
        let interactor = AddItemInteractor()
        let wireframe = AddItemWireframe()
        let presenter = AddItemPresenter(interactor: interactor, wireframe: wireframe)
        let viewController = AddItemViewController(presenter: presenter)
        wireframe.presentingViewController = viewController
        presenter.view = viewController

        return viewController
    }
}
