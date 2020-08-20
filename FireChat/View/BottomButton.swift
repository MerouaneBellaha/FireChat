//
//  BottomButton.swift
//  FireChat
//
//  Created by Merouane Bellaha on 20/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

class BottomButton: UIButton {
    init(firstString: String, secondString: String, target: UIViewController?, action: Selector) {
        super.init(frame: .zero)
        let attributedTitle = NSMutableAttributedString(string: firstString,
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white ])
        attributedTitle.append(NSAttributedString(string: secondString,
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                               .foregroundColor: UIColor.white]))
        setAttributedTitle(attributedTitle, for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
