//
//  Section.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Section : Codable {
    var title: String
    var caption: String
    var body: String
    var imageName: String
    var publishDate: Date
    
    enum CodingKeys: String, CodingKey {
        case title, caption, body
        case imageName = "image"
        case publishDate = "publish_date"
    }
}
