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

    private var loginViewModel: LoginViewModel {
        let email = emailContainerView.getTextField().text
        let password = passwordContainerView.getTextField().text
        return LoginViewModel(email: email, password: password)
    }

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
    // is target needed? and if not don't need to keep the lazy var 
    private lazy var loginButton = CustomButton(title: "Log in", target: (LoginController() as UIViewController), action: #selector(handleLogin))
    private lazy var noAccountButton = BottomButton(firstString: "Don't have an account?  ",
                                                    secondString: "Sign Up",
                                                    target: (LoginController() as UIViewController), action: #selector(displayRegistrationVC))

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors

    @objc
    func handleLogin() {
        print("handle login")
    }

    @objc
    func displayRegistrationVC() {
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }

    @objc
    func checkFormStatus() {
        if loginViewModel.formIsValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.6597909927, green: 0.27138412, blue: 0.8506523371, alpha: 1)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
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
        configureTextFields()
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

    private func configureTextFields() {
        [emailContainerView, passwordContainerView].forEach { container in
            container.getTextField().addTarget(self, action: #selector(checkFormStatus), for: .editingChanged)
        }
    }
}
