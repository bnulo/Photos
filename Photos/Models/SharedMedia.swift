//
//  SharedMedia.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation

struct SharedMedia: Codable {

    let id: String
    let size: Int
    let createdAt: String
    let thumbnailUrlString: String
    let resx: Int
    let resy: Int

    var sizeInMegaByte: String {

        let megabytes: Double = size.double/(1048576.0) // 1048576.0 = 1024*1024
        return "\(String(format: "%.2f", megabytes)) MB"
    }

    var createdDate: Date {
        createdAt.rfc3339Date ?? Date()
    }

    var xYAspectRatio: Double {
        resx.double/resy.double
    }

    // MARK: -

    enum CodingKeys: String, CodingKey {
        case id, size, resx, resy
        case createdAt = "created_at"
        case thumbnailUrlString = "thumbnail_url"
    }
}

extension SharedMedia {

    static let items: [SharedMedia] = {

        guard let url = Bundle.main.url(forResource: "sharedMediaItems", withExtension: "json")
        else {
            fatalError("Unable to Find Stub Data")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to Load Stub Data")
        }

        guard let items = try? JSONDecoder().decode([SharedMedia].self, from: data) else {
            fatalError("Unable to Decode Stub Data")
        }

        return items
    }()
}
