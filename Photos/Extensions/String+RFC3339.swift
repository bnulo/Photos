//
//  String+RFC3339.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation

extension String {

    var rfc3339Date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}
