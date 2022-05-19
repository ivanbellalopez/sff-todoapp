import UIKit

final class ListWireframe: ListWireframeInterface {

    weak var presentingViewController: UIViewController?

    func presentAddItem() {
        let addItemViewController = AddItemConfigurator.prepareScene()
        let navigationController = UINavigationController(rootViewController: addItemViewController)
        navigationController.modalPresentationStyle = .fullScreen
        presentingViewController?.present(navigationController, animated: true, completion: nil)
    }

    func presentDetailItem(_ item: Item) {
        let detailItemViewController = DetailItemConfigurator.prepareScene(for: item)
        presentingViewController?.show(detailItemViewController, sender: self)
    }
}
