//
//  RegistrationViewModel.swift
//  FireChat
//
//  Created by Merouane Bellaha on 20/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import Foundation

struct RegistrationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?

    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false &&
            fullName?.isEmpty == false && userName?.isEmpty == false
    }
}
