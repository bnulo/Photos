//
//  DateFormatter+Custom.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation

extension DateFormatter {

    static let ddMMMyyyyDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMddyyyy")
        return formatter
    }()
}
