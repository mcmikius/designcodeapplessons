//
//  Section.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct SectionCodable : Codable {
    
    var id : String
    var title: String
    var caption: String
    var body: String
    var imageName: String
    var publishDate: Date
    var chapterNumber : String
    
}
