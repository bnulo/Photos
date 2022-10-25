//
//  ImageURLBuilder.swift
//  Photos
//
//  Created by bnulo on 10/23/22.
//

import Foundation

final class ImageURLBuilder {

    private let source: URL?

    private var width: Int?
    private var height: Int?
    private var resizeMode: ResizeMode?

    init(urlString: String) {

        self.source = URL(string: urlString)
    }

    // MARK: -

    func width(_ width: Int) -> ImageURLBuilder {

        self.width = width
        return self
    }

    func height(_ height: Int) -> ImageURLBuilder {

        self.height = height
        return self
    }

    func resizeMode(_ resizeMode: ResizeMode) -> ImageURLBuilder {

        self.resizeMode = resizeMode
        return self
    }

    func build() -> URL? {
/*
 https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/
 imageresize/i/60cc705d0025904750ee22d300020eb4/0.jpg
 ?h=500&w=200&m=bb
 */
        guard let url = source else { return nil }
        guard var urlComponents: URLComponents = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true) else {
            return nil
        }

        var queryItems: [URLQueryItem] = []

        if let width = width {
            let item = URLQueryItem(name: "w", value: "\(width)")
            queryItems.append(item)
        }

        if let height = height {
            let item = URLQueryItem(name: "h", value: "\(height)")
            queryItems.append(item)
        }

        if let resizeMode = resizeMode {
            let item = URLQueryItem(name: "m", value: "\(resizeMode.rawValue)")
            queryItems.append(item)
        }

        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
            return urlComponents.url
        }

        return source
    }
}
