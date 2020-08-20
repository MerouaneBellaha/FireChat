//
//  UIViewController + configureStackView.swift
//  FireChat
//
//  Created by Merouane Bellaha on 20/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

extension UIViewController {
    func configureStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }
}
