//
//  ViewController.swift
//  Try_MVP
//
//  Created by Mac on 8/19/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class LoginVC : UIViewController {

    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loginPressnter : LoginPresenter!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loginPressnter = LoginPresenter(init: self)
    }

    @IBAction func loginUser(_ sender: Any) {
        self.loginPressnter.loginUser(userEmailStr: self.userNameTextField.text!, userPasswordStr: self.passwordTextField.text!)
    }
    
}

