//
//  APIServiceProtocol.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import Alamofire

protocol APIServiceProtocol {

    func getListMediaInASharedItem(completion: @escaping (Result<[SharedMedia], AFError>) -> Void)
}
