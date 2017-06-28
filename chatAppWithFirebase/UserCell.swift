//
//  UserCell.swift
//  chatAppWithFirebase
//
//  Created by Євген Хижняк on 27.06.17.
//  Copyright © 2017 Євген Хижняк. All rights reserved.
//

import UIKit
import Firebase

class UserCell: UITableViewCell {
    
   var message: Message! {
        didSet {
            if let toId = message?.toId {
                let ref = Database.database().reference().child("users").child(toId)
                ref.observeSingleEvent(of: .value, with: { (snapshot) in
                    if let dict = snapshot.value as? [String: AnyObject] {
                        self.textLabel?.text = dict["name"] as? String
                        if let profileImageUrl = dict["profileImageUrl"] as? String {
                            self.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl: profileImageUrl)
                        }
                    }
                }, withCancel: nil)
            }
            detailTextLabel?.text = message.text
            if let minutes = message.timestamp?.doubleValue {
                let date = NSDate(timeIntervalSince1970: minutes)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm a"
                let dateString = dateFormatter.string(from: date as Date)
                
                timeLabel?.text = dateString
            }
            
            
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: 55, y: ((textLabel?.frame.origin.y)! - 2), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        detailTextLabel?.frame = CGRect(x: 55, y: ((detailTextLabel?.frame.origin.y)! + 2), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "good1")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let timeLabel: UILabel? = {
        let label = UILabel()
        label.text = "HH:MM"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(profileImageView)
        addSubview(timeLabel!)
        
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        timeLabel?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        timeLabel?.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        timeLabel?.widthAnchor.constraint(equalToConstant: 80).isActive = true
        timeLabel?.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

