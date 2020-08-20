//
//  RegistrationController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 19/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {

    // MARK: - Properties

    private let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(displayPickerController), for: .touchUpInside)
        return button
    }()

    private let emailContainerView = InputContainerView(imageName: "envelope",
                                                        textFieldSettings: TextFieldSettings(placeholder: "email"))
    private let nameContainerView = InputContainerView(imageName: "person",
    textFieldSettings: TextFieldSettings(placeholder: "full name"))
    private let usernameContainerView = InputContainerView(imageName: "person",
    textFieldSettings: TextFieldSettings(placeholder: "username"))
    private let passwordContainerView = InputContainerView(imageName: "lock",
    textFieldSettings: TextFieldSettings(placeholder: "password"))
    private let signUpButton = CustomButton(title: "Sign Up")
    // control target parameters value and if needed to keep the lazy var
    private lazy var alreadyHaveAccountButton = BottomButton(firstString: "Already have an account?  ",
                                               secondString: "Sign In",
                                               target: (RegistrationController() as UIViewController), action: #selector(displayLoginVC))
    

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors

    @objc
    func displayPickerController() {
        print("k")
    }

    @objc
    func displayLoginVC() {
        navigationController?.pushViewController(LoginController(), animated: true)
    }

    // MARK: - Helpers

    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        configureGradientBackground()
        configureAddPhotoButton()
        let stack = configureStackView(arrangedSubviews: [emailContainerView, nameContainerView,
                                                          usernameContainerView, passwordContainerView, signUpButton])
        view.addSubview(stack)
        stack.setAnchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                        paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        configureAlreadyHaveAccountButton()
    }

    private func configureAddPhotoButton() {
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view)
        addPhotoButton.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        addPhotoButton.imageView?.setDimensions(height: 120, width: 155)
    }

    private func configureAlreadyHaveAccountButton() {
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.setAnchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
