import UIKit

final class AddItemViewController: UIViewController {

    // MARK: - Views

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .boldSystemFont(ofSize: 20)
        textField.placeholder = "Name"
        return textField
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .boldSystemFont(ofSize: 20)
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 6
        return textView
    }()

    private let addButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Add", for: .normal)
        return button
    }()

    // MARK: - Vars

    private let presenter: AddItemPresenterInterface

    // MARK: - Init

    init(presenter: AddItemPresenterInterface) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewReady()
        setupViews()
        applyConstraints()
    }

    // MARK: - Setups

    private func setupViews() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        let doneItemButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeItemButtonTapped))
        navigationItem.rightBarButtonItem = doneItemButton

        addButton.addTarget(self, action: #selector(didAddButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(descriptionTextView)
        stackView.addArrangedSubview(addButton)
        view.addSubview(stackView)
    }

    // MARK: - Constraints

    private func applyConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 24),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }

    // MARK: - Actions
}

extension AddItemViewController: AddItemViewInterface {

    func setupView(title: String) {
        self.title = title
    }
}

private extension AddItemViewController {

    @objc func closeItemButtonTapped() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    @objc func didAddButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let description = descriptionTextView.text, !description.isEmpty else {
                  presenter.didCloseButtonTapped()
                  return
              }

        presenter.didAddButtonTapped(name: name, description: description)
    }
}
