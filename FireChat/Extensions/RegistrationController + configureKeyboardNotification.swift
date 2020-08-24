//
//  RegistrationController + configureKeyboardNotification.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

extension RegistrationController {

    func configureKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc
    private func keyboardWillShow() {
        guard view.frame.origin.y == 0 else { return }
        view.frame.origin.y -= 88
    }

    @objc
    private func keyboardWillHide() {
        guard view.frame.origin.y != 0 else { return }
        view.frame.origin.y = 0
    }
}
