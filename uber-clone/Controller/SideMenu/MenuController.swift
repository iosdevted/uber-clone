//
//  MenuController.swift
//  uber-clone
//
//  Created by Ted Hyeong on 27/10/2020.
//

import UIKit

private let reuseIdentifer = "MenuCell"

enum MenuOptions: Int, CaseIterable, CustomStringConvertible {
    case yourTrips
    case settings
    case logout
    
    var description: String {
        switch self {
        case .yourTrips: return "Your Trips"
        case .settings: return "Settings"
        case .logout: return "Log Out"
        }
    }
}

protocol MenuControllerDelegate: class {
    func didSelect(options: MenuOptions)
}

class MenuController: UITableViewController {
    
    // MARK: - Properties
    
    private let user: User
    weak var delegate: MenuControllerDelegate?
    
    private lazy var menuHeader: MenuHeader = {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 140)
        
        let view = MenuHeader(user: user, frame: frame)
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
    // MARK: - Selectors
    
    // MARK: -  Helpers
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.tableHeaderView = menuHeader
    }
}

extension MenuController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath)
        cell.textLabel?.text = "Meny Option"
        
        guard let option = MenuOptions(rawValue: indexPath.row) else { return UITableViewCell() }
        cell.textLabel?.text = option.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let option = MenuOptions(rawValue: indexPath.row) else { return }
        delegate?.didSelect(options: option)
    }
}
