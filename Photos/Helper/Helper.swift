//
//  Helper.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import UIKit

func log(_ text: Any) {
    if FeatureFlags.debug {
        print(text)
    }
}
