//
//  InputContainerView.swift
//  FireChat
//
//  Created by Merouane Bellaha on 20/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

struct TextFieldSettings {
    var secured: Bool
    var placeholder: String

    init(secured: Bool = false, placeholder: String) {
        self.secured = secured
        self.placeholder = placeholder
    }
}

class InputContainerView: UIView {

    let imageView = UIImageView()
    let textField = UITextField()

    init(imageName: String, textFieldSettings: TextFieldSettings) {
        super.init(frame: .zero)
        setHeight(height: 50)
        
        setImageView(imageName: imageName)
        setTextField(with: textFieldSettings)
        setDividerView()
    }

    func setImageView(imageName: String) {
        imageView.image = UIImage(systemName: imageName)
        imageView.tintColor = .white
        imageView.alpha = 0.87
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.setAnchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 24, width: 24)
    }

    func setTextField(with textFieldSettings: TextFieldSettings) {
        textField.isSecureTextEntry = textFieldSettings.secured
        textField.tag = 1
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.attributedPlaceholder = NSAttributedString(string: textFieldSettings.placeholder,
                                                             attributes: [.foregroundColor: UIColor.white])
        textField.font = UIFont.systemFont(ofSize: 16)
        addSubview(textField)
        textField.centerY(inView: self)
        textField.setAnchor(left: imageView.rightAnchor, bottom: bottomAnchor,
                            right: rightAnchor, paddingLeft: 8, paddingBottom: -8)
    }

    func setDividerView() {
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.setAnchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, height: 0.75)
    }

    func getTextField() -> UITextField {
        guard let textField = viewWithTag(1) as? UITextField else { return UITextField() }
        return textField
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

