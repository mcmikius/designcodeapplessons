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
    
    lazy var sections: Array<Section> = {
        guard let path = Bundle.main.path(forResource: "Sections", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url) else { return [] }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let sections = try decoder.decode(Array<Section>.self, from: data)
            return sections
        } catch {
            print(error)
        }
        return []
    }()
    
    lazy var bookmarks : Array<Bookmark> = {
        
        guard let path = Bundle.main.path(forResource: "Bookmarks", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let bookmarks = try decoder.decode(Array<Bookmark>.self, from: data)
            return bookmarks
        } catch {
            print(error)
        }
        
        return []
    }()
}
