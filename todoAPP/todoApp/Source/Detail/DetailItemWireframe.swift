import UIKit

final class DetailItemWireframe: DetailItemWireframeInterface {

    weak var presentingViewController: UIViewController?

    func goBack() {
        presentingViewController?.navigationController?.popViewController(animated: true)
    }
}
