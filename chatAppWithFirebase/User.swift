//
//  UserModel.swift
//  chatAppWithFirebase
//
//  Created by Євген Хижняк on 21.06.17.
//  Copyright © 2017 Євген Хижняк. All rights reserved.
//

import Foundation

class User: NSObject {
    var id: String?
    var name: String?
    var email: String?
    var profileImageUrl: String?
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.email = dictionary["email"] as? String
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
}
