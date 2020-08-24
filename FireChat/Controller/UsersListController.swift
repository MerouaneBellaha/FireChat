//
//  UsersListController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

final class UsersListController: UITableViewController {

    // MARK: - Properties
    var users: [User] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

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
        tableView.register(UserCell.self, forCellReuseIdentifier: K.userCell)
        tableView.rowHeight = 80
    }
}

// MARK: - UITableViewDelegate

extension UsersListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: K.userCell, for: indexPath) as! UserCell
        cell = UserCell(user: users[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDataSource

extension UsersListController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
}

