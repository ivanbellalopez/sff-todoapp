import UIKit

final class DetailItemConfigurator {

    class func prepareScene(for item: Item) -> DetailItemViewController {
        let interactor = DetailItemInteractor()
        let wireframe = DetailItemWireframe()
        let presenter = DetailItemPresenter(interactor: interactor, wireframe: wireframe, item: item)
        let viewController = DetailItemViewController(presenter: presenter)
        wireframe.presentingViewController = viewController
        presenter.view = viewController

        return viewController
    }
}
