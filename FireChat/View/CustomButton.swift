//
//  CustomButton.swift
//  FireChat
//
//  Created by Merouane Bellaha on 20/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

final class CustomButton: UIButton {
    var isAvailable = false {
        didSet {
            if isAvailable == true {
                isEnabled = true
                backgroundColor =  #colorLiteral(red: 0.6597909927, green: 0.27138412, blue: 0.8506523371, alpha: 1)
            } else {
                isEnabled = false
                backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            }
        }
    }

    init(title: String,/* target: UIViewController?,*/ action: Selector) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        setTitleColor(.white, for: .normal)
        isEnabled = false
        setHeight(height: 50)
        addTarget(nil, action: action, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
