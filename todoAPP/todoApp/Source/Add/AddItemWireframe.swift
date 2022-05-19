import UIKit

final class AddItemWireframe: AddItemWireframeInterface {

    weak var presentingViewController: UIViewController?

    func dismiss() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
