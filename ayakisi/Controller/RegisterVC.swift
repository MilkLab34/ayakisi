//
//  RegisterVC.swift
//  ayakisi
//
//  Created by Mustafa Hastürk on 01/09/16.
//  Copyright © 2016 Mustafa Hastürk. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
  
  @IBOutlet weak var logoImageV: UIImageView!
  @IBOutlet weak var facebookView: UIView!
  @IBOutlet weak var backgroundImageV: UIImageView!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var phoneField: UITextField!
  @IBOutlet weak var dateField: UITextField!
  @IBOutlet weak var tcField: UITextField!
  @IBOutlet weak var genderSwitch: UISwitch!
  
  // MARK: LC
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func registerAction(sender: UIButton) {
    let email = emailField.text!
    let phone = phoneField.text!
    let date = dateField.text!
    let tc = tcField.text!
    let gender : String = {
      if genderSwitch.on {
        return "Erkek"
      } else {
        return "Kadın"
      }
    }()
    
    let parameters = [
      "email": email,
      "phone": phone,
      "date": date,
      "tc": tc,
      "gender": gender
    ]
    let registerRequest = RegisterRequest(parameters: parameters)
    Client.shared.execute(registerRequest, encoding: .JSON) { (response) in
      let _ = response.result.value
      // Process
    }
  }
  
}
