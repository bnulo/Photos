//
//  APIManager.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import Alamofire

class APIManager: APIServiceProtocol {

  static let shared = APIManager()

  let sessionManager: Session = {
    let configuration = URLSessionConfiguration.af.default
//      configuration.timeoutIntervalForRequest = 30 // we do not use cause we  cach
//      configuration.waitsForConnectivity = true // we do not use cause we cach
      configuration.requestCachePolicy = .returnCacheDataElseLoad
    let responseCacher = ResponseCacher(behavior: .modify { _, response in
      let userInfo = ["date": Date()]
      return CachedURLResponse(
        response: response.response,
        data: response.data,
        userInfo: userInfo,
        storagePolicy: .allowed)
    })

    let networkLogger = NetworkLogger()
    let interceptor = APIRequestInterceptor()

    return Session(
      configuration: configuration,
      interceptor: interceptor,
      cachedResponseHandler: responseCacher,
      eventMonitors: [networkLogger])
  }()
}

extension APIManager {

    func getListMediaInASharedItem(completion: @escaping (Result<[SharedMedia], AFError>) -> Void) {
    sessionManager.request(Router.getListMediaInASharedItem)
      .responseDecodable(of: [SharedMedia].self) { response in

          switch response.result {
          case .failure(let error):
              completion(.failure(error))
          case .success(let responseResult):
              completion(.success(responseResult))
          }
      }
  }
}
