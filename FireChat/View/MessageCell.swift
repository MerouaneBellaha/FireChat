//
//  MessageCell.swift
//  FireChat
//
//  Created by Merouane Bellaha on 25/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {

    // MARK: - Properties

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()

    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.text = "kk"
        return textView
    }()

    private let bubbleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    private func configureUI() {
        configureProfileImageView()
        configureBubbleContainer()
        configureTextView()
    }

    private func configureProfileImageView() {
        addSubview(profileImageView)
        profileImageView.setAnchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 8, paddingBottom: -4)
        profileImageView.setDimensions(height: 32, width: 32)
        profileImageView.layer.cornerRadius = 32/2
    }

    private func configureBubbleContainer() {
        addSubview(bubbleContainer)
        bubbleContainer.layer.cornerRadius = 12
        bubbleContainer.setAnchor(top: topAnchor, left: profileImageView.rightAnchor, paddingLeft: 12)
        bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
    }

    private func configureTextView() {
        bubbleContainer.addSubview(textView)
        textView.setAnchor(top: bubbleContainer.topAnchor, left: bubbleContainer.leftAnchor,
                           bottom: bubbleContainer.bottomAnchor, right: bubbleContainer.rightAnchor,
                           paddingTop: 4, paddingLeft: 12, paddingBottom: 4, paddingRight: 12)
    }
}
