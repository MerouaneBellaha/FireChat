//
//  UIViewController + configureStackView.swift
//  FireChat
//
//  Created by Merouane Bellaha on 20/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

extension UIViewController {
    func configureStackView(arrangedSubviews: [UIView], callback topView: () -> UIView) {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.axis = .vertical
        stack.spacing = 16

        view.addSubview(stack)
        stack.setAnchor(top: topView().bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
        paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
}
