import UIKit


final class ListViewController: UIViewController {

    // MARK: - Views

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Vars
    private let presenter: ListPresenterInterface
    private var items: [Item] = []

    // MARK: - Init

    init(presenter: ListPresenterInterface) {
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
        setupViews()
        applyConstraints()

        presenter.viewReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    // MARK: - Setups

    private func setupViews() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        let addItemButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemButtonTapped))
        navigationItem.rightBarButtonItem = addItemButton

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    // MARK: - Constraints

    private func applyConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

extension ListViewController: ListViewInterface {

    func setupView(title: String) {
        self.title = title
    }

    func updateView(with items: [Item]) {
        self.items = items
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
                return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "UITableViewCell")
            }
            return cell
        }()

        var content = cell.defaultContentConfiguration()
        content.text = todoItems[indexPath.row].name
        content.secondaryText = todoItems[indexPath.row].description
        cell.contentConfiguration = content
        return cell
    }
}

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = todoItems[indexPath.row]
        presenter.itemTapped(with: currentItem.id)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let currentItem = todoItems[indexPath.row]
            presenter.deleteItemTapped(with: currentItem.id)

            // We can do it locally as well
            // todoItems.remove(at: indexPath.row)
            // tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

private extension ListViewController {

    @objc func addItemButtonTapped() {
        presenter.addItemTapped()
    }
}
