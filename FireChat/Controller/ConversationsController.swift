//
//  ConversationsController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 19/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit
import Firebase

final class ConversationsController: UIViewController {

    // MARK: - Properties

    private let tableView = UITableView()
    private let plusButton = PlusButton(selector: #selector(displayUsersListController))
    private let fetchService = FetchService()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        authentificateUser()
    }

    // MARK: - Selectors

    @objc
    private func displayUsersListController() {
        let destinationVC = UsersListController()
        fetchService.fetchUsers() { users in
            destinationVC.users = users
            destinationVC.delegate = self
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }

    }

    @objc
    private func logout() {
        do {
            try Auth.auth().signOut()
            presentLoginScreen()
        }
        catch { print("error loggingout") }
    }

    // MARK: - API

    private func authentificateUser() {
        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
        } else {
            print("user is alreay loggedin")
        }
    }

    // MARK: - Helpers

    private func presentLoginScreen() {
        DispatchQueue.main.async {
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        }
    }

    private func configureUI() {
        view.backgroundColor = .white

        configureNavigationBar()
        configureTableView()
        configurePlusButton()

        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(logout))
    }

    private func configurePlusButton() {
        view.addSubview(plusButton)
        plusButton.setAnchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                             paddingBottom: 16, paddingRight: 24)
    }


    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.conversationCell)

        // Separator lines equal to cells in the tableView ( means no extra separator lines )
        tableView.tableFooterView = UIView()

        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.frame = view.frame
    }
}

// MARK: - TableViewDataSource

extension ConversationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.conversationCell, for: indexPath)
        return cell
    }
}

// MARK: - TableViewDelegate

extension ConversationsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
}

// MARK: - UsersListControllerDelegate

extension ConversationsController: UsersListControllerDelegate {
    func didStartAConversation(with user: User) {
        print("hello \(user.userName)")
        navigationController?.pushViewController(ChatController(user: user), animated: true)
    }
}
