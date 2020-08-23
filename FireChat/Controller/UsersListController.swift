//
//  UsersListController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserCell"

final class UsersListController: UITableViewController {

    // MARK: - Properties

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
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    private func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
}

// MARK: - UITableViewDelegate

extension UsersListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        return cell
    }
}

// MARK: - UITableViewDataSource

extension UsersListController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
}

