//
//  Memo.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import Foundation

// Hashable: 

struct Memo: Codable, Identifiable {
    var id: String
    var folder : String
    var title : String
    var content : String
    
    init(id: String = UUID().uuidString, folder: String, title: String, content: String) {
        self.id = id
        self.folder = folder
        self.title = title
        self.content = content
    }
}
