//
//  ChatController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 24/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

final class ChatController: UICollectionViewController {

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

    private func configureUI() {
        collectionView.backgroundColor = .white
        configureNavBar()
        configureCollectionView()
    }

    private func configureNavBar() {
        navigationItem.title = "\(user.userName.capitalized)"
    }

    private func configureCollectionView() {
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: K.Cell.message)
        collectionView.alwaysBounceVertical = true
    }
}

// MARK: - UICollectionViewDataSource

extension ChatController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Cell.message, for: indexPath) as! MessageCell
        return cell
    }
}


extension ChatController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 16, left: 0, bottom: 16, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}

