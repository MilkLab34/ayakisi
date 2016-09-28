//
//  LoginRequest.swift
//  ayakisi
//
//  Created by Mustafa Hastürk on 02/09/16.
//  Copyright © 2016 Mustafa Hastürk. All rights reserved.
//

import Alamofire

final class LoginRequest : Request {
  var path = "/login"
  var method: Method = .POST
  var parameters: [String : AnyObject]?
  var headers: [String : String]?
  
  init(parameters p : [String : AnyObject]? = nil, headers h: [String : String]? = nil) {
    self.parameters = p
    self.headers = h
  }
  
}