//
//  Bookmark.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct PartCodable : Codable {
    
    enum PartType : String {
        case text, image, video, code
    }
    
    var type : PartType?
    var id : String
    var typeName : String
    var title : String
    var content : String
    
    enum CodingKeys : String, CodingKey {
        case content, id, title
        case typeName = "type"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        typeName = try values.decode(String.self, forKey: .typeName)
        title = try values.decode(String.self, forKey: .title)
        content = try values.decode(String.self, forKey: .content)
        
        type = PartType(rawValue: typeName)
    }
}
