//
//  RealmManager.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/27/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import RealmSwift

class RealmManager {
    
    static var realm = try! Realm()
    
    static var bookmarks: Results<Bookmark> { return realm.objects(Bookmark.self) }
    
    static var sections: Results<Section> { return realm.objects(Section.self) }
    
    class func remove(_ bookmark : Bookmark) {
        
        try! realm.write { realm.delete(bookmark) }
    }
    
    class func loadFromData () {
        
        let contentAPI = ContentAPI.shared
        
        let bookmarks = contentAPI.bookmarks
        let sections = contentAPI.sections
        let parts = contentAPI.parts
        
        sections.forEach { $0.parts.append(objectsIn: parts) }
        
        bookmarks.forEach { (bookmark) in
            bookmark.section = sections
                .filter { $0.id == bookmark.sectionId }
                .first
            bookmark.part = parts
                .filter { $0.id == bookmark.partId }
                .first
        }
        
        try! realm.write { realm.add(sections, update: true) }
        
        try! realm.write { realm.add(bookmarks) }
    }
}

