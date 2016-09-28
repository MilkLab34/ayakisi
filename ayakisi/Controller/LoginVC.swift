//
//  LoginVC.swift
//  ayakisi
//
//  Created by Mustafa Hastürk on 01/09/16.
//  Copyright © 2016 Mustafa Hastürk. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginVC: UIViewController {
  
  @IBOutlet weak var facebookView: UIView!
  @IBOutlet weak var backgroundImageV: UIImageView!
  @IBOutlet weak var logoImageV: UIImageView!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  // MARK: LC
  override func viewDidLoad() {
    super.viewDidLoad()
    addGestures()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func addGestures() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(LoginVC.facebookAction))
    facebookView.addGestureRecognizer(gesture)
  }
  
  func facebookAction() {
    
  }
  
  @IBAction func loginAction(sender: UIButton) {
    let email = emailField.text!
    let password = passwordField.text!
    
    let parameters : [String : String] = ["email": email,
                                          "password": password]
    let loginRequest = LoginRequest(parameters: parameters)
    
    Client.shared.execute(loginRequest, encoding: .JSON) { (response) in
      let _ = response.result.value
      // Process
    }
    
  }

  
}
