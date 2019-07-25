//
//  Bookmark.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Bookmark : Codable {
    
    enum BookmarkType : String {
        case text, image, video, code
    }
    
    var type : BookmarkType?
    
    var typeName : String
    var chapterNumber : String
    var sectionTitle : String
    var partHeading : String
    var content : String
    
    enum CodingKeys : String, CodingKey {
        case content
        case sectionTitle = "section"
        case partHeading = "part"
        case typeName = "type"
        case chapterNumber = "chapter"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        typeName = try values.decode(String.self, forKey: .typeName)
        chapterNumber = try values.decode(String.self, forKey: .chapterNumber)
        sectionTitle = try values.decode(String.self, forKey: .sectionTitle)
        partHeading = try values.decode(String.self, forKey: .partHeading)
        content = try values.decode(String.self, forKey: .content)
        
        type = BookmarkType(rawValue: typeName)
    }
}
