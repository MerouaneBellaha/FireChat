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

    

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print(passwordContainerView.getTextField().text)
    }

    // MARK: - Helpers

    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        configureGradientLayer()
        configureIconImage()
        configureStackView()
    }

    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

    func configureIconImage() {
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
    }

    func configureStackView() {
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 16

        view.addSubview(stack)
        stack.setAnchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                        paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
}
