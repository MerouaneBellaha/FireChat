//
//  UsersListController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

protocol UsersListControllerDelegate: class {
    func didStartAConversation(with user: User)
}

final class UsersListController: UITableViewController {

    // MARK: - Properties
    var users: [User] = []
    weak var delegate: UsersListControllerDelegate?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selector


    // MARK: - Helpers

    private func configureUI() {
        view.backgroundColor = .white
        configureNavBar()
        configureTableView()
    }

    private func configureNavBar() {
        navigationItem.title = "Users"
//        navigationController?.navigationBar.prefersLargeTitles = false
    }
    private func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: K.Cell.user)
        tableView.rowHeight = 80
    }
}

// MARK: - UITableViewDataSource

extension UsersListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.user, for: indexPath) as! UserCell
        cell = UserCell(user: users[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UsersListController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: false)
        delegate?.didStartAConversation(with: users[indexPath.row])
    }
}

