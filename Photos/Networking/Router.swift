//
//  Router.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import Alamofire

enum Router {

    case getListMediaInASharedItem

    // MARK: -

    var baseURL: String {

        switch self {

        case .getListMediaInASharedItem:
            return APIConstants.baseUrl
        }
    }

    // MARK: -

    var path: String {

        switch self {
        case .getListMediaInASharedItem:
            return "/shared/\(APIConstants.shareId)/media"

        }
    }

    // MARK: -

    var method: HTTPMethod {

        switch self {
        case .getListMediaInASharedItem:
            return .get
        }
    }

    // MARK: -

    var headers: HTTPHeaders {

        switch self {

        case .getListMediaInASharedItem:
            return [:]
        }
    }

    // MARK: -

    var parameters: [String: String]? {
        switch self {

        case .getListMediaInASharedItem:
            return [:]
        }
    }
}

// MARK: - URLRequestConvertible

extension Router: URLRequestConvertible {

    func asURLRequest() throws -> URLRequest {

        let url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers

        if method == .get {
            request = try URLEncodedFormParameterEncoder()
                .encode(parameters, into: request)
        } else if method == .post {
            request = try JSONParameterEncoder().encode(parameters, into: request)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }

        return request
    }
}
