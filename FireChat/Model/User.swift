//
//  User.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import Foundation

struct User {
    let userID: String
    let profileImageUrl: String
    let userName: String
    let fullName: String
    let email: String

    init(data: [String: Any]) {
        userID = data["userID"] as? String ?? K.emptyString
        profileImageUrl = data["profileImageUrl"] as? String ?? K.emptyString
        userName = data["userName"] as? String ?? K.emptyString
        fullName = data["fullName"] as? String ?? K.emptyString
        email = data["email"] as? String ?? K.emptyString
    }
}
