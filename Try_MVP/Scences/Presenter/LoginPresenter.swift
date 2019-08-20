//
//  LoginPresenter.swift
//  Try_MVP
//
//  Created by Mac on 8/19/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

protocol LoginView : class {
    func initLoader()
    func showIndicator()
    func hidenIndicator()
    func loginUser()
    func showError(title:String,errorString: String)
  
}
class LoginPresenter : NSObject {
   
    private weak var loginView  : LoginView?
    private let disposeBag      = DisposeBag()
    private var json4Swift_Base : Json4Swift_Base!
    init(init loginView : LoginView){
        self.loginView = loginView
    }
  
//
    func loginUser(userEmailStr:String,userPasswordStr:String){
        if userEmailStr.count != 0 {
            if userPasswordStr.count != 0 {
        let params = [
            "user_email"    : userEmailStr,
            "user_password" : userPasswordStr
            ] as NSDictionary
      
        loginView?.showIndicator()
        LoginInteractor.sharedInstance.loginUser(url:"http://localhost:8888/Skin_Avenus/webservices/api/Login_User.php" , withParameters: params)
            .subscribe(
                onNext: {
                    json4Swift_Base
                    in
                    self.json4Swift_Base = json4Swift_Base
                    self.loginView?.hidenIndicator()
                    
            },
                onError:{
                    error in
                       self.loginView?.hidenIndicator()
                       self.loginView?.showError(title:"Error",errorString: error.localizedDescription)
            }
          ).disposed(by: disposeBag)
        }
        }else{
            self.loginView?.showError(title:"Error",errorString: "Please Fill Empty field")
        }
     }
    
    
}


