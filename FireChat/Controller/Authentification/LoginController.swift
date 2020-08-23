//
//  LoginController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 19/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

final class LoginController: UIViewController {
    
    // MARK: - Properties

    private let authService = AuthService()

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
    // if problem with target -> lazy var + addTarget to parameters?
    private let loginButton = CustomButton(title: "Log in", action: #selector(handleLogin))
    private let noAccountButton = BottomButton(firstString: "Don't have an account?  ",
                                                    secondString: "Sign Up",
                                                    action: #selector(displayRegistrationVC))


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors

    @objc
    private func handleLogin() {
        guard let email = emailContainerView.getTextField().text,
            let password = passwordContainerView.getTextField().text else { return }
        showHUD(with: "Logging in")
        authService.logUserIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                self.HUD?.dismiss()
                print(error!.localizedDescription)
                return
            }
            self.dismiss(animated: true)
        }
    }

    @objc
    private func displayRegistrationVC() {
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }

    @objc
    private func checkFormStatus() {
        loginButton.isAvailable = loginViewModel.formIsValid
    }

    // MARK: - Helpers

    private func configureUI() {
        hideNavigationBar()
        configureGradientBackground()
        configureIconImage()
        configureStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton]) { iconImage }
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
