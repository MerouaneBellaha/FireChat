//
//  FetchService.swift
//  FireChat
//
//  Created by Merouane Bellaha on 23/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import Firebase

struct FetchService {
    func fetchUsers(completion: @escaping (([User]) -> Void)) {
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            completion(snapshot?.documents.map { User(data: $0.data()) } ?? [])
        }
    }
}
