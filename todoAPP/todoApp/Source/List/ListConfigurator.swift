import UIKit

final class ListConfigurator {

    class func prepareScene() -> ListViewController {
        let interactor = ListInteractor()
        let wireframe = ListWireframe()
        let presenter = ListPresenter(interactor: interactor, wireframe: wireframe)
        let viewController = ListViewController(presenter: presenter)
        wireframe.presentingViewController = viewController
        presenter.view = viewController

        return viewController
    }
}
