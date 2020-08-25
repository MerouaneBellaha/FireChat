//
//  CustomInputAccessoryView.swift
//  FireChat
//
//  Created by Merouane Bellaha on 24/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

class CustomInputAccessoryView: UIView {

    // MARK: - Properties

    override var intrinsicContentSize: CGSize { .zero }

    private let messageInputTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.layer.cornerRadius = 5
        return textView
    }()

    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("send", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemPurple, for: .normal)
        button.addTarget(self, action: #selector(handleSendMessage), for: .touchUpInside)
        return button
    }()

    private let placeHolder: UILabel = {
        let label = UILabel()
        label.text = "Enter message"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        autoresizingMask = .flexibleHeight
        configureUI()
        messageInputTextView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selector

    @objc
    func handleSendMessage() {
        print("send message handling")
    }

    // MARK: - Helpers

    func configureUI() {
        configureButton()
        configureTextView()
        configurePlaceHolder()
        setShadow()
    }

    func configureTextView() {
        addSubview(messageInputTextView)
        messageInputTextView.setAnchor(top: topAnchor, left: leftAnchor,
                                       bottom: safeAreaLayoutGuide.bottomAnchor, right: sendButton.leftAnchor,
                                       paddingTop: 12, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
    }

    func configureButton() {
        addSubview(sendButton)
        sendButton.setAnchor(top: topAnchor, right: rightAnchor,
                             paddingTop: 4, paddingRight: 8)
        sendButton.setDimensions(height: 50, width: 50)
    }

    func configurePlaceHolder() {
        addSubview(placeHolder)
        placeHolder.centerY(inView: messageInputTextView,
                            leftAnchor: messageInputTextView.leftAnchor, paddingLeft: 4)
    }

    func setShadow() {
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: -8)
        layer.shadowColor = UIColor.systemPurple.cgColor
    }

}

// MARK: - UITextViewDelegate

// #25 > 17'
extension CustomInputAccessoryView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeHolder.isHidden = !textView.text.isEmpty
    }
}
