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
    
    class func updateContent () {
        
        Content.load { (response: Response<Content>) in
            try! realm.write { realm.add(response.data.chapters, update: true) }
        }
    }
}

