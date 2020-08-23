//
//  PlusButton.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

final class PlusButton: UIButton {

    init(selector: Selector) {
        super.init(frame: .zero)
        setImage(UIImage(systemName: "plus"), for: .normal)
        backgroundColor = .systemPurple
        tintColor = .white
        imageView?.setDimensions(height: 24, width: 24)
        setDimensions(height: 56, width: 56)
        layer.cornerRadius = 28
        addTarget(nil, action: selector, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
