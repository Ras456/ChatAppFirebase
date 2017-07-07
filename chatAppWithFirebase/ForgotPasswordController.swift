//
//  ForgotPasswordController.swift
//  chatAppWithFirebase
//
//  Created by Євген Хижняк on 05.07.17.
//  Copyright © 2017 Євген Хижняк. All rights reserved.
//

import UIKit
import Firebase

@objcMembers
class ForgotPasswordController: UIViewController {
    
    let loginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(viewContainer)
        view.addSubview(emailTextField)
        view.addSubview(nameWindow)
        view.addSubview(resetButton)
        
    
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        setNavigationBar()
        setupViewContainer()
        setupEmailTextField()
        setupWindowName()
        setupResetButton()
        

    }
    
    let viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.placeholder = "Enter email "
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let nameWindow: UILabel = {
        let name = UILabel()
        name.text = "Reset Password"
        name.font = UIFont.systemFont(ofSize: 30)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = UIColor.white
        return name
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Reset", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        
        return button
    }()
    
    func setupViewContainer() {
        viewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupWindowName() {
        nameWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameWindow.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -45).isActive = true
    }
    
    func setupEmailTextField() {
        emailTextField.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, constant: -50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupResetButton() {
        resetButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15).isActive = true
        resetButton.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor).isActive = true
        resetButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor).isActive = true
        resetButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 60))
        let navItem = UINavigationItem()
        let cancelItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: nil, action: #selector(handleCancel))
        navItem.leftBarButtonItem = cancelItem
        
        navBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleResetPassword() {
        if emailTextField.text! == "" {
            let alertController = UIAlertController(title: "Error", message: "Enter email", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            return
        } else {
            Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { (error) in
                if error != nil {
                    print("error")
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Error", style: .cancel, handler: nil)
                    alertController.addAction(action)
                    self.present(alertController, animated: true, completion: nil)
                    return
                } else {
                    print("Enjoy")
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
            
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
 }
