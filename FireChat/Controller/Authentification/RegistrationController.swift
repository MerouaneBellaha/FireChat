//
//  RegistrationController.swift
//  FireChat
//
//  Created by Merouane Bellaha on 19/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit
import Firebase

class RegistrationController: UIViewController {

    // MARK: - Properties

    private let authService = AuthService()

    private var registrationViewModel: RegistrationViewModel {
        let email = emailContainerView.getTextField().text
        let password = passwordContainerView.getTextField().text
        let fullName = nameContainerView.getTextField().text
        let userName = usernameContainerView.getTextField().text
        return RegistrationViewModel(email: email, password: password, fullName: fullName, userName: userName)
    }

    private let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
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
    // is target needed? and if not don't need to keep the lazy var 
    private lazy var signUpButton = CustomButton(title: "Sign Up", target: RegistrationController(), action: #selector(handleRegistration))
    private lazy var alreadyHaveAccountButton = BottomButton(firstString: "Already have an account?  ",
                                                             secondString: "Log In",
                                                             target: RegistrationController(), action: #selector(displayLoginVC))

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors

    @objc
    func displayPickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }

    @objc
    func checkFormStatus() {
        signUpButton.isAvailable = registrationViewModel.formIsValid
    }

    @objc
    func displayLoginVC() {
        navigationController?.popViewController(animated: true)
    }

    @objc
    func handleRegistration() {
        guard let email = emailContainerView.getTextField().text,
            let password = passwordContainerView.getTextField().text,
            let fullName = nameContainerView.getTextField().text,
            let userName = usernameContainerView.getTextField().text?.lowercased(),
            let profileImage = addPhotoButton.imageView?.image ?? UIImage(systemName: "person"),
            let profileImageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let credentials = RegistrationCredentials(email: email, password: password, fullName: fullName,
                                                  userName: userName, profileImageData: profileImageData)
        authService.credentials = credentials
        authService.createUser { error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    self.dismiss(animated: true)
                }

//        let userFactory = UserFactory(email: email, password: password, fullName: fullName,
//                                      userName: userName, profileImageData: profileImageData)
//        userFactory.createUser { error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            self.dismiss(animated: true)
//        }
    }
    // MARK: - Helpers

    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        configureGradientBackground()
        configureAddPhotoButton()
        configureStackView(arrangedSubviews: [emailContainerView, nameContainerView,
                                              usernameContainerView, passwordContainerView, signUpButton]) { addPhotoButton }
        configureAlreadyHaveAccountButton()
        configureTextFields()
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

    private func configureTextFields() {
        [emailContainerView, passwordContainerView,
         nameContainerView, usernameContainerView].forEach { container in
            container.getTextField().addTarget(self, action: #selector(checkFormStatus), for: .editingChanged)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        addPhotoButton.setDimensions(height: 155, width: 155)
        if let imageViewConstraints = addPhotoButton.imageView?.constraints {
            addPhotoButton.imageView?.removeConstraints(imageViewConstraints)
        }
        addPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width / 2
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        addPhotoButton.layer.borderWidth = 3.0
        dismiss(animated: true)
    }
}
