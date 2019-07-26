//
//  ContentAPI.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

class ContentAPI {
    static var shared: ContentAPI = ContentAPI()
    
    lazy var bookmarks : Array<BookmarkCodable> = {
        return load(into: Array<BookmarkCodable>.self, resource: "Bookmarks") ?? []
    }()
    
    lazy var parts : Array<PartCodable> = {
        return load(into: Array<PartCodable>.self, resource: "Parts") ?? []
    }()
    
    lazy var sections : Array<SectionCodable> = {
        return load(into: Array<SectionCodable>.self, resource: "Sections") ?? []
    }()
    
    func load<T : Codable>(into swiftType : T.Type, resource : String, ofType type : String = "json") -> T? {
        
        let path = Bundle.main.path(forResource: resource, ofType: type)
        let url = URL(fileURLWithPath: path!)
        
        guard let data = try? Data(contentsOf: url) else { return nil }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return try! decoder.decode(swiftType.self, from: data)
    }
}
