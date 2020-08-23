//
//  UIViewController + HUD.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import JGProgressHUD

extension UIViewController {

    var HUD: JGProgressHUD? {
        return view.subviews.first(where: { $0 is JGProgressHUD }) as? JGProgressHUD
    }

    func showHUD(with text: String? = "Loading") {
        view.endEditing(true)
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = text
        hud.show(in: view)
    }
}
