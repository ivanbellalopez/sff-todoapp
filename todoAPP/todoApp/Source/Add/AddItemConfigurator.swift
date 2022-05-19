import UIKit

final class AddItemConfigurator {

    class func prepareScene() -> AddItemViewController {
        let repository = Repository()
        let interactor = AddItemInteractor(repository: repository)
        let wireframe = AddItemWireframe()
        let presenter = AddItemPresenter(interactor: interactor, wireframe: wireframe)
        let viewController = AddItemViewController(presenter: presenter)
        wireframe.presentingViewController = viewController
        presenter.view = viewController

        return viewController
    }
}
