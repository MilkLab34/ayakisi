//
//  Request.swift
//  ayakisi
//
//  Created by Mustafa Hastürk on 01/09/16.
//  Copyright © 2016 Mustafa Hastürk. All rights reserved.
//

import Alamofire

protocol Request {
  var path : String { get }
  var method : Method { get }
  var parameters : [String : AnyObject]? { get }
  var headers : [String : String]? { get }
}

final class Client {
  private init() {}

  static let shared = Client()
  let baseURL = "http://mustafahasturk.com"
  
  func execute(request : Request,
                      encoding : ParameterEncoding = .URL,
                      completionHandler : (Response<AnyObject, NSError>) -> Void) {
    
    let url = baseURL + request.path
    Alamofire
      .request(request.method,
                      url,
                      parameters: request.parameters,
                      encoding: encoding,
                      headers: request.headers)
      .responseJSON { response in
      completionHandler(response)
    }
  }
  
}