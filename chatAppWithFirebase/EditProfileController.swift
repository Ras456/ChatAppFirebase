//
//  EditProfileController.swift
//  chatAppWithFirebase
//
//  Created by Євген Хижняк on 06.07.17.
//  Copyright © 2017 Євген Хижняк. All rights reserved.
//

import UIKit

class EditProfileController: UIViewController {
    
    var user: User?
    
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let nameApp: UILabel = {
        let name = UILabel()
        name.text = "Chat App"
        name.font = UIFont.systemFont(ofSize: 30)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = UIColor.white
        return name
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(hundleSaveButton))
        
        view.addSubview(inputsContainerView)
        view.addSubview(profileImageView)
        view.addSubview(nameApp)
        
        
//        setupInputsContainerView()
//        setupLoginRegisterButton()
//        setupProfileImageView()
//        setupLoginRegisterSegmentedControl()
//        setupNameApp()
//        setupforgotPasswordButton()
        
        
    }
    
    @objc func hundleSaveButton() {
        print("Save")
    }
    
}
