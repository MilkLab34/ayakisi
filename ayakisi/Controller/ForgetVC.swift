//
//  ForgetVC.swift
//  ayakisi
//
//  Created by Mustafa Hastürk on 01/09/16.
//  Copyright © 2016 Mustafa Hastürk. All rights reserved.
//

import UIKit

class ForgetVC: UIViewController {
  
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var backgroundImageV: UIImageView!
  
  // MARK: LC
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func sendAction(sender: AnyObject) {
    let email = emailField.text!
    let parameters = ["email": email]
    let forgetRequest = ForgetRequest(parameters: parameters)
    Client.shared.execute(forgetRequest, encoding: .JSON) { (response) in
      let _ = response.result.value
      // Process
    }
  }
  
}
