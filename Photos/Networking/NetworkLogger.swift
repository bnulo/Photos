//
//  NetworkLogger.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
  let queue = DispatchQueue(label: "photos.networklogger")

  func requestDidFinish(_ request: Request) {
    log(request.description)
  }

  func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
    guard let data = response.data else {
      return
    }
    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
      log(json)
    }
  }
}
