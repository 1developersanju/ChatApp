//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Drole on 16/05/21.
//

import UIKit

class RegisterViewController: UIViewController {

    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "ironman")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "lets join"
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let firstNameField: UITextField = {
       let emailField = UITextField()
        emailField.placeholder = "First Name"
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 1
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    private let lastNameField: UITextField = {
       let emailField = UITextField()
        emailField.placeholder = "Last Name"
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 1
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    private let emailField: UITextField = {
        let emailField = UITextField()
         emailField.placeholder = "Email Adress"
         emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
         emailField.layer.borderColor = UIColor.lightGray.cgColor
         emailField.layer.cornerRadius = 12
         emailField.layer.borderWidth = 1
         emailField.leftViewMode = .always
         emailField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 5, height: 0))
         return emailField
     }()
    private let passwordField: UITextField = {
       let passwordField = UITextField()
        passwordField.placeholder = "Password..."
        passwordField.isSecureTextEntry = true
        passwordField.returnKeyType = .done
        passwordField.leftViewMode = .always
        passwordField.layer.cornerRadius = 12
        passwordField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 5, height: 0))
        passwordField.layer.borderWidth = 1

        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        return passwordField
    }()


    private let  regButton : UIButton = {
       let regButton = UIButton()
        regButton.backgroundColor = .systemGreen
        regButton.layer.masksToBounds = true
        regButton.layer.cornerRadius = 12
        regButton.layer.borderWidth = 1
        regButton.setTitleColor(.white, for: .normal)
        regButton.setTitle("Register", for: .normal)
        regButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return regButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Come in"
        view.backgroundColor = .white
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
//                                                            style: .done,
//                                                            target: self,
//                                                            action: #selector(tappedRegister))
        
        regButton.addTarget(self,
                         action: #selector(regButtonTapped),
                         for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(label)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(regButton)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true

        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedChangeProfilePic))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(gesture)
    }
    @objc private func tappedChangeProfilePic() {
        print("Change profile Pic")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        
        imageView.frame = CGRect(x: 30,
                                 y: scrollView.bottom+10,
                                 width: scrollView.width-60,
                                 height: size)
        
        label.frame = CGRect(x: 30,
                             y: 80,
                             width: imageView.width,
                             height: 50)
        
        firstNameField.frame = CGRect(x: 30,
                                  y: label.bottom+10,
                                  width: scrollView.width-60,
                                  height: 50)
        
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.bottom+10,
                                  width: scrollView.width-60,
                                  height: 52)
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.bottom+10,
                                  width: scrollView.width-60,
                                  height: 52)
        
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom+10,
                                     width: scrollView.width-60,
                                     height: 52)
     
        regButton.frame = CGRect(x: 25,
                              y: passwordField.bottom+25,
                              width: scrollView.width-50,
                              height: 52)

    }
    
    @objc private func regButtonTapped(){
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()

        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !email.isEmpty,
              !password.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              password.count >= 6 else {
            alertUserLoginError()
            return
        }
        // Firebase log In
    }
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Oops!",
                                      message: "Please enter all the informations to create a new account. ",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true)
    }
    
//    @objc private func tappedRegister(){
//        let vcontroller = RegisterViewController()
//        vcontroller.title = "Create Account"
//        navigationController?.pushViewController(vcontroller, animated: true)
//    }

}


extension RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            regButtonTapped()
        }
        
        return true
    }
}
