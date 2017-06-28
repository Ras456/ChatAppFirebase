//
//  NewMessageVC.swift
//  chatAppWithFirebase
//
//  Created by Євген Хижняк on 21.06.17.
//  Copyright © 2017 Євген Хижняк. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class NewMessageVC: UITableViewController {
    
    var messagesController: MessagesVC?
    
    let identifier = "CellIdentifier"
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        tableView.register(UserCell.self, forCellReuseIdentifier: identifier)
        
        fetchUser()
    }

    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dict = snapshot.value as? [String: AnyObject] {
                let user = User()
                user.id = snapshot.key
                user.setValuesForKeys(dict)
                self.users.append(user)
                
                DispatchQueue.main.async() {
                     self.tableView.reloadData()
                }
            }
            
            print(snapshot)
        }, withCancel: nil)
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! UserCell
        let user = users[indexPath.row]
        let profileImageUrl = user.profileImageUrl
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl: profileImageUrl!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForRowAt)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            let user = self.users[indexPath.row]
            print("dismiss")
            self.messagesController?.showChatControllerForUser(user: user)
            
        }
    }
}
