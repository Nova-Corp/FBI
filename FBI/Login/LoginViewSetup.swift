//
//  LoginViewSetup.swift
//  FBI
//
//  Created by ADMIN on 01/10/19.
//  Copyright © 2019 Success Resource Pte Ltd. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {

    func loginViewsetup () {
        
//    MARK: Username TextField
        let usernameField = getTextField(placeHolder: "Password")
        self.view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 22),
            usernameField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            usernameField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            usernameField.heightAnchor.constraint(equalToConstant: 43)
        ])
        
//    MARK: Password TextField
        let passwordField = getTextField(placeHolder: "Password")
        self.view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            passwordField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            passwordField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 43)
        ])
        
//     MARK: Login Button
        let loginBtn = getButton(title: "Login")
        self.view.addSubview(loginBtn)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            loginBtn.heightAnchor.constraint(equalToConstant: 43),
            loginBtn.widthAnchor.constraint(equalToConstant: 86),
            loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func getTextField(placeHolder: String) -> UITextField {
        let mTextField = UITextField()
        
        mTextField.backgroundColor = .white
        mTextField.borderStyle = .line
        mTextField.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        mTextField.textColor = .black
        mTextField.layer.cornerRadius = 4
        mTextField.layer.masksToBounds = true
        mTextField.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return mTextField
    }
    
    func getButton(title: String) -> UIButton {
        let mButton = UIButton()
        mButton.backgroundColor = .blue
        mButton.layer.cornerRadius = 4
        mButton.layer.masksToBounds = true
        mButton.titleLabel?.textColor = .white
        mButton.setTitle(title, for: .normal)
        return mButton
    }
}
