//
//  ChatController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 24/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

class ChatController: UICollectionViewController {

    // MARK: - Properties

    private let user: User
    private lazy var messageInputView = CustomInputAccessoryView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
    override var inputAccessoryView: UIView? { messageInputView }
    override var canBecomeFirstResponder: Bool { true }

    // MARK: - Init

    init(user: User) {
        self.user = user

        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Licecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selector



    // MARK: - Helpers

    func configureUI() {
        collectionView.backgroundColor = .white
        configureNavBar()
    }

    func configureNavBar() {
        navigationItem.title = "\(user.userName.capitalized)"
    }
}
