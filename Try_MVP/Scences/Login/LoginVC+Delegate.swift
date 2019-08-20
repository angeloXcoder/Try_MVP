//
//  LoginVC+LoginDelegate.swift
//  Try_MVP
//
//  Created by Mac on 8/20/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import JGProgressHUD
import AZDialogView

extension LoginVC : LoginView{

    func initLoader(){
      
    }

    func showIndicator() {
       
    }
    
    func hidenIndicator() {
      // JGProgressHUD.dismiss(in: self)
        
    }
    
    func loginUser() {
        
    }
    
    func showError(title:String,errorString: String) {
        let dialogController = AZDialogViewController(title: "Error", message: errorString)
        dialogController.dismissDirection = .none
        dialogController.dismissWithOutsideTouch = false
        dialogController.titleColor     = .red
        dialogController.blurBackground =  true
        dialogController.messageColor   = .red
        dialogController.cancelEnabled = true
        //        dialogController.alertBackgroundColor  = AppTheme.backgroundMessageBox()
        
        dialogController.cancelButtonStyle = { (button,height) in
            button.tintColor  = .red
            button.setTitle("Ok", for: [])
//            button.borderColor = .red
            return true //must return true, otherwise cancel button won't show.
        }
        dialogController.show(in: self)
       
    }
}
