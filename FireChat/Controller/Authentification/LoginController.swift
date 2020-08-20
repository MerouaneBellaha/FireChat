//
//  LoginController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 19/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties

    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = .white
        return imageView
    }()

    private let emailContainerView = InputContainerView(imageName: "envelope",
                                                        textFieldSettings: TextFieldSettings(placeholder: "email"))
    private let passwordContainerView = InputContainerView(imageName: "lock",
                                                           textFieldSettings: TextFieldSettings(secured: true, placeholder: "password"))
    private let loginButton = CustomButton(title: "Log in")
    // control target parameters value and if needed to keep the lazy var
    private lazy var noAccountButton = BottomButton(firstString: "Don't have an account?  ",
                                                    secondString: "Sign Up",
                                                    target: (LoginController() as UIViewController), action: #selector(displayRegistrationVC))

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print(passwordContainerView.getTextField().text)
    }

    // MARK: - Selectors

    @objc
    func displayRegistrationVC() {
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }

    // MARK: - Helpers

    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        configureGradientBackground()
        configureIconImage()
        let stack = configureStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        view.addSubview(stack)
        stack.setAnchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                        paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        configureNoAccButton()
    }

    private func configureIconImage() {
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
    }

    private func configureNoAccButton() {
        view.addSubview(noAccountButton)
        noAccountButton.centerX(inView: view)
        noAccountButton.setAnchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
