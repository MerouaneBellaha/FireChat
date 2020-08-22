//
//  AuthService.swift
//  FireChat
//
//  Created by Merouane Bellaha on 22/08/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import Firebase

struct RegistrationCredentials {
    var email: String
    var password: String
    var fullName: String
    var userName: String
    var profileImageData: Data
}

struct FirestoreData {
    var profileImageUrl: String
    var userID: String
}

class AuthService {

    var ref: StorageReference!
    var credentials: RegistrationCredentials!

    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }

    func createUser(completion: @escaping ((Error?) -> Void)) {
        storeProfileImageData() { metaData, error in
            guard error == nil else {
                completion(error!)
                return
            }
            self.createUserInAuth { result, error in
                guard error == nil, let result = result else {
                    completion(error!)
                    return
                }
                self.createFirestoreUserData(firestoreCredentials: result, completion: completion)
            }
        }
    }

    /// create an unique ID for the profileImageData, create a new reference in Storage with unique ID, put profileImageData in this ref
    private func storeProfileImageData(completion: @escaping ((StorageMetadata?, Error?) -> Void)) {
        let fileName = NSUUID().uuidString
        ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        ref.putData(credentials.profileImageData, metadata: nil, completion: completion)
    }

    /// retrieve profileImageURL, create user in Auth, if success: get userID and pass through callBack an instance of FirestoreData
    private func createUserInAuth(callBack: @escaping (FirestoreData?, Error?) -> Void) {
        self.ref.downloadURL { (url, error) in
            guard let profileImageUrl = url?.absoluteString else { return }

            Auth.auth().createUser(withEmail: self.credentials.email,
                                   password: self.credentials.password) { (result, error) in
                guard error == nil else {
                    callBack(nil, error!)
                    return
                }
                guard let userID = result?.user.uid else { return }
                                    
                let credentials = FirestoreData(profileImageUrl: profileImageUrl, userID: userID)
                callBack(credentials, nil)
            }
        }
    }

    /// set user data, create a document (named: userID) in  "users" collection in Firestore containing user data
    private func createFirestoreUserData(firestoreCredentials: FirestoreData,
                                         completion: ((Error?) -> Void)?) {
        let data: [String: Any] = ["email": credentials.email,
                                   "fullName": credentials.fullName,
                                   "profileImageUrl": firestoreCredentials.profileImageUrl,
                                   "userID": firestoreCredentials.userID,
                                   "userName": credentials.userName]

        Firestore.firestore().collection("users").document(firestoreCredentials.userID).setData(data, completion: completion)
    }
}
