//
//  APIMockService.swift
//  Photos
//
//  Created by bnulo on 10/23/22.
//

import Foundation
import Alamofire

struct APIMockService: APIServiceProtocol {
    // For testing
    var result: Result<[SharedMedia], AFError>

    func getListMediaInASharedItem(completion: @escaping (Result<[SharedMedia], AFError>) -> Void) {
            completion(result)
    }
}
