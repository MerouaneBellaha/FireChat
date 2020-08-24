//
//  UserCell.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {

    // MARK: - Properties

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPurple
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLabel, fullNameLabel])
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureProfileImageView()
        configureStackView()
    }

    convenience init(user: User) {
        self.init()
        fullNameLabel.text = user.fullName
        userNameLabel.text = user.userName
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
    }


    // MARK: - Helpers

    func configureProfileImageView() {
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        profileImageView.setDimensions(height: 56, width: 56)
        profileImageView.layer.cornerRadius = 56 / 2
    }

    func configureStackView() {
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
