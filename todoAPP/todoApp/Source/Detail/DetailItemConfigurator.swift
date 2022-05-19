import UIKit

final class DetailItemConfigurator {

    class func prepareScene(for itemId: String) -> DetailItemViewController {
        let repository = Repository()
        let interactor = DetailItemInteractor(repository: repository)
        let wireframe = DetailItemWireframe()
        let presenter = DetailItemPresenter(interactor: interactor, wireframe: wireframe, itemId: itemId)
        let viewController = DetailItemViewController(presenter: presenter)
        wireframe.presentingViewController = viewController
        presenter.view = viewController

        return viewController
    }
}
